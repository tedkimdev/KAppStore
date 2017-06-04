//
//  AppDetailInfo.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 4..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

struct AppDetailInfo {
  
  // MARK: Properties
  
  var id: String?
  var appName: String!
  var artistName: String?
  var description: String?
  var advisoryRating: String?
  var releaseNotes: String?
  var screenshotURLs: [String]?
  
  
  // MARK: Initializing
  
  init(dictionary: [String: Any]) {
    self.id = dictionary["trackId"] as? String ?? ""
    self.appName = dictionary["trackCensoredName"] as? String ?? ""
    self.artistName = dictionary["artistName"] as? String ?? ""
    self.description = dictionary["description"] as? String ?? ""
    self.advisoryRating = dictionary["contentAdvisoryRating"] as? String ?? ""
    self.releaseNotes = dictionary["releaseNotes"] as? String ?? ""
    self.screenshotURLs = dictionary["screenshotUrls"] as? [String] ?? []
  }
  
}
