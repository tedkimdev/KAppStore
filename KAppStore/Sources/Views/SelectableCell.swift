//
//  SelctableCell.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 6..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class SelectableCell: UICollectionViewCell {
  
  // MARK: UI
  
  @IBOutlet weak var titleLabel: UILabel!
  
  
  // MARK: View Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  
  // MARK: Configuring
  
  func configure(title: String) {
    self.titleLabel.text = title
    self.setNeedsLayout()
  }
  
  
  // MARK: Size
  
  class func height() {
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
}
