//
//  AppDetailFooter.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 5..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class AppDetailFooter: UICollectionReusableView {
  
  // MARK: UI
  
  @IBOutlet weak var artistNameLabel: UILabel!
  
  // MARK: - View Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  
  // MARK: Configuring
  
  func configure(artistName: String) {
    self.artistNameLabel.text = artistName
  }
  
}
