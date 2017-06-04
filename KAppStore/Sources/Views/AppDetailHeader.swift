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
  
  @IBOutlet weak var appNameLabel: UILabel!
  @IBOutlet weak var artistNameLabel: UILabel!
  @IBOutlet weak var appImageView: CustomImageView!
  @IBOutlet weak var downloadButton: UIButton!
  @IBOutlet weak var reviewCountLabel: UILabel!
  @IBOutlet weak var contentAdvisoryRatingLabel: UILabel!
  
  
  // MARK: - View Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.appImageView.backgroundColor = .red
    self.appImageView.layer.cornerRadius = 16
    self.appImageView.contentMode = .scaleAspectFill
    self.appImageView.layer.masksToBounds = true
    
    self.downloadButton.layer.borderWidth = 0.5
    self.downloadButton.layer.borderColor = UIColor.rgb(red: 0, green: 129, blue: 250).cgColor
    self.downloadButton.layer.cornerRadius = 5
    
    self.contentAdvisoryRatingLabel.layer.borderWidth = 0.5
    self.contentAdvisoryRatingLabel.layer.borderColor = UIColor.darkGray.cgColor
  }
  
  
  // MARK: Configuring
  
  func configure(appDetailInfo: AppDetailInfo) {
    self.appDetailInfo = appDetailInfo
    guard let appDetailInfo = self.appDetailInfo else { return }
    
    self.appNameLabel.text = appDetailInfo.appName
    self.artistNameLabel.text = appDetailInfo.artistName ?? ""
    self.contentAdvisoryRatingLabel.text = appDetailInfo.advisoryRating
    
    if let appImageURL = appDetailInfo.appImageURL {
      self.appImageView.loadImage(urlString: appImageURL)
    }
    
    if let reviewCount = appDetailInfo.reviewCount, reviewCount > 0 {
      self.reviewCountLabel.text = "(\(reviewCount))"
    } else { self.reviewCountLabel.text = "" }
  }
  
}
