//
//  Date+ConvertStringToDate.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 6..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import Foundation

extension Date {
  
  static func convertISODateStringToDate(string: String) -> String {
    let isoDate = string //"2016-04-14T10:44:00+0000"
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let date = dateFormatter.date(from:isoDate)!
    
    dateFormatter.dateFormat = "yyyy.MM.dd"
    let dateString = dateFormatter.string(from: date)
    
    return dateString
  }
  
}
