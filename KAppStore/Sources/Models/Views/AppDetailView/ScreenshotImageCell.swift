//
//  ScreenshotImageCell.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 5..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class ScreenshotImageCell: UICollectionViewCell {
  
  // MARK: UI
  
  @IBOutlet weak var imageView: CustomImageView!
  
  
  // MARK: View Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  
  // MARK: Configuring
  
  func configure(imageURL: String) {
    self.imageView.loadImage(urlString: imageURL)
  }
  
  
  // MARK: Size
  
  class func height() {
    
  }
  
}
