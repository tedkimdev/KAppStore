//
//  CustomImageView.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 4..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

var imageCache = [String: UIImage]()

class CustomImageView: UIImageView {
  
  var lastURLUsedToLoadImage: String?
  
  func loadImage(urlString: String) {
    self.lastURLUsedToLoadImage = urlString
    
    if let cachedImage = imageCache[urlString] {
      self.image = cachedImage
      return
    }
    
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, response, err) in
      if let err = err {
        print("Failed to fetch image:", err)
        return
      }
      
      // 이미지 중복 방지, dataTask 동작은 backgroud 에서 비동기로 돌기 때문에, 이미지가 중복해서 출력되는 경우가 있다. 비동기로 완료됐을 때 url String과 각 셀의 url String을 비교해줘서 중복 노출을 방지
      if url.absoluteString != self.lastURLUsedToLoadImage {
        return
      }
      
      guard let imageData = data else { return }
      let appImage = UIImage(data: imageData)
      
      imageCache[url.absoluteString] = appImage
      
      DispatchQueue.main.async {
        self.image = appImage
      }
      
      }.resume()
  }
  
}
