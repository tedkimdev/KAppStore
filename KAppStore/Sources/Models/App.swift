//
//  App.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 4..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

struct App {
  
  // MARK: Properties
  
  var id: String!
  var appName: String!
  var imageURL: String?
  var summary: String?
  var category: String!
  
  var desc: String?
  var appInformation: Any?
  
  
  // MARK: Initializing
  
  init(dictionary: [String: Any]) { // code smell
    if let idDictionary = dictionary["id"] as? [String: Any],
      let idAttributes = idDictionary["attributes"] as? [String: Any] {
      self.id = idAttributes["im:id"] as? String ?? ""
    }
    
    if let appName = dictionary["im:name"] as? [String: Any] {
      self.appName = appName["label"] as? String ?? ""
    }
    
    if let summary = (dictionary["summary"] as? [String: Any])?["label"] as? String {
      self.summary = summary
    }
    
    if let category = dictionary["category"] as? [String: Any],
      let categoryAttributes = category["attributes"] as? [String: Any] {
      self.category = categoryAttributes["label"] as? String ?? ""
    }
    
    if let imageURLArray = dictionary["im:image"] as? [[String: Any]] {
      switch UIScreen.main.scale {
      case 1.0:
        self.imageURL = imageURLArray[0]["label"] as? String ?? ""
      case 2.0:
        self.imageURL = imageURLArray[1]["label"] as? String ?? ""
      case 3.0:
        self.imageURL = imageURLArray[2]["label"] as? String ?? ""
      default:
        self.imageURL = imageURLArray[1]["label"] as? String ?? ""
      }
    }
    
    // TODO: 나머지 속성 값 세팅
    
  }
  
  init(id: String?, appName: String?, imageURL: String?, summary: String?, category: String?) {
    self.id = id ?? ""
    self.appName = appName ?? ""
    self.imageURL = imageURL ?? ""
    self.summary = summary ?? ""
    self.category = category ?? ""
  }
  
  static func sampleAppList() -> [App] {
    
    var apps = [App]()
    
    for i in 1...10 {
      let app = App(
        id: "839333328",
        appName: "Toss 토스 : 송금이 쉬워진다\(i)",
        imageURL: "http://is3.mzstatic.com/image/thumb/Purple117/v4/d3/6f/3e/d36f3e01-13b0-67ed-6697-45613ccb1e75/mzl.kludrleb.png/53x53bb-85.png",
        summary: "Toss 토스 : 송금이 쉬워진다\(i)",
        category: "금융\(i)"
      )
      apps.append(app)
    }
    return apps
  }
  
}
