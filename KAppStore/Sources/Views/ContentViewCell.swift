//
//  ContentViewCell.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 5..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class ContentViewCell: UICollectionViewCell {
  
  // MARK: UI
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var contentLabel: UILabel!
  
  
  // MARK: Configuring
  
  func configure(title: String, content: String) {
    self.titleLabel.text = title
    self.contentLabel.text = content
    
    self.setNeedsLayout()
  }
  
  override func layoutSubviews() {
    
  }
  
  
}
