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
  
  var id: Int!
  var appName: String!
  var artistName: String!
  var description: String?
  var advisoryRating: String?
  var releaseNotes: String?
  var appImageURL: String?
  var screenshotURLs: [String]?
  var reviewCount: Int?
  var releaseDate: String!
  var averageUserRating: Float?
  var genre: String!
  var minimumOsVersion: String!
  var appVersion: String!
  
  
  // MARK: Initializing
  
  init(dictionary: [String: Any]) {
    self.id = dictionary["trackId"] as? Int ?? 0
    self.appName = dictionary["trackCensoredName"] as? String ?? ""
    self.artistName = dictionary["artistName"] as? String ?? ""
    self.description = dictionary["description"] as? String ?? ""
    self.advisoryRating = dictionary["contentAdvisoryRating"] as? String ?? ""
    self.releaseNotes = dictionary["releaseNotes"] as? String ?? ""
    self.appImageURL = dictionary["artworkUrl100"] as? String ?? ""
    self.screenshotURLs = dictionary["screenshotUrls"] as? [String] ?? []
    self.reviewCount = dictionary["userRatingCountForCurrentVersion"] as? Int ?? 0
    self.releaseDate = dictionary["currentVersionReleaseDate"] as? String ?? ""
    self.averageUserRating = dictionary["averageUserRating"] as? Float ?? 0
    
    self.genre = dictionary["primaryGenreName"] as? String ?? ""
    self.minimumOsVersion = dictionary["minimumOsVersion"] as? String ?? ""
    self.appVersion = dictionary["version"] as? String ?? ""
  }
  
  func informationCellData() -> [String: String] {
    var dictionary = [String: String]()
    
    var key = "개발자\n\n"
    var value = self.artistName + "\n\n"
    
    key = key + "카테고리\n\n"
    value = value + self.genre + "\n\n"
    
    key = key + "업데이트\n\n"
    value = value + Date.convertISODateStringToDate(string: self.releaseDate) + "\n\n"
    
    key = key + "버전\n\n"
    value = value + self.appVersion + "\n\n"
    
    if let advisoryRating = self.advisoryRating {
      key = key + "등급"
      value = value + advisoryRating + ""
    }
    
    key += "\n"
    value += "\n"
    
    dictionary[key] = value
    
    return dictionary
  }
  
}
