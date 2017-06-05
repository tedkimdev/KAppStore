//
//  CellModel.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 5..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

struct CellType {
  var items: [CellItemType]
}

enum CellItemType {
  case screenshot
  case content(title: String)
  case information
  case selectable
  case artistName
}
