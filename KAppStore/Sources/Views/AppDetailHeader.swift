//
//  headerTest.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 4..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class AppDetailHeader: UICollectionReusableView {
  
  // MARK: Properties
  
  var appDetailInfo: AppDetailInfo?
  
  
  // MARK: UI
  
  @IBOutlet weak var appImageView: UIImageView!
  @IBOutlet weak var downloadButton: UIButton!
  
  
  // MARK: - View Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.appImageView.backgroundColor = .red
    self.appImageView.layer.cornerRadius = 16
    self.appImageView.contentMode = .scaleAspectFill
    self.appImageView.layer.masksToBounds = true
    
    self.downloadButton.layer.borderWidth = 1
    self.downloadButton.layer.borderColor = UIColor.rgb(red: 0, green: 129, blue: 250).cgColor
    self.downloadButton.layer.cornerRadius = 5
  }
  
  
  // MARK: Configuring
  
  func configure(appDetailInfo: AppDetailInfo) {
    
  }
  
}
