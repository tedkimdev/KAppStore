//
//  AppService.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 4..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import Foundation

enum DataResponse<T> {
  case success(T)
  case failure(Error)
}

struct ApiService {
  
  // TODO: Paging..
  
  /// 금융 카테고리 무료 앱 순위 가져오기
  static func appList(limit: Int, genre: Int, completion: @escaping (DataResponse<[App]>) -> () ) {
    let urlString = "https://itunes.apple.com/kr/rss/topfreeapplications/limit=\(limit)/genre=\(genre)/json"
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
      
      if let error = error {
        return completion(DataResponse.failure(error))
      }
      
      do {
        guard let data = data else { return }
        
        let json = try (JSONSerialization.jsonObject(with: data, options: .mutableContainers))
        
        guard let result = json as? [String: Any],
          let feed = result["feed"] as? [String: Any],
          let entry = feed["entry"] as? [[String: Any]] else { return }
        
        let apps = entry.map({ dictionary -> App in
          return App(dictionary: dictionary)
        })
        
        DispatchQueue.main.async {
          completion(DataResponse.success(apps))
        }
        
      } catch let jsonError {
        completion(DataResponse.failure(jsonError))
      }
    }.resume()
  }

  /// 앱 상세 정보 가져오기
  static func appDetail(appId: String, country: String, completion: @escaping (DataResponse<AppDetailInfo>) -> ()) {
    let urlString = "https://itunes.apple.com/lookup?id=\(appId)&country=\(country)"
    guard let url = URL(string: urlString) else { return }
    
    // location (다운로드한 파일이 저장될 임시 파일 경로)
    // response (요청에 대한 상태 코드)
    // error
    URLSession.shared.downloadTask(with: url) { location, response, error in
     
      if let error = error {
        return completion(DataResponse.failure(error))
      }
      
      do {
        guard let path = location?.path else { return }
        guard let data = FileManager.default.contents(atPath: path) else { return }
        
        let json = try (JSONSerialization.jsonObject(with: data, options: .mutableContainers))
        guard let jsonDictionary = json as? [String: Any],
          let results = jsonDictionary["results"] as? [[String: Any]],
          let dictionary = results.first else { return }
        
        DispatchQueue.main.async {
          completion(DataResponse.success(AppDetailInfo(dictionary: dictionary)))
        }
        
      } catch let jsonError {
        completion(DataResponse.failure(jsonError))
      }
    }.resume()
  }
}

