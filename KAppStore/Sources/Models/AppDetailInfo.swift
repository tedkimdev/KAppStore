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
  var appImageURL: String?
  var screenshotURLs: [String]?
  var reviewCount: Int?
  
  // MARK: Initializing
  
  init(dictionary: [String: Any]) {
    self.id = dictionary["trackId"] as? String ?? ""
    self.appName = dictionary["trackCensoredName"] as? String ?? ""
    self.artistName = dictionary["artistName"] as? String ?? ""
    self.description = dictionary["description"] as? String ?? ""
    self.advisoryRating = dictionary["contentAdvisoryRating"] as? String ?? ""
    self.releaseNotes = dictionary["releaseNotes"] as? String ?? ""
    self.appImageURL = dictionary["artworkUrl100"] as? String ?? ""
    self.screenshotURLs = dictionary["screenshotUrls"] as? [String] ?? []
    self.reviewCount = dictionary["userRatingCountForCurrentVersion"] as? Int ?? 0
  }
  
}
