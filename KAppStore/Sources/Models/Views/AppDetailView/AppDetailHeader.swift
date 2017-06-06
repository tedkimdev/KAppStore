//
//  headerTest.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 4..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class AppDetailHeader: UICollectionReusableView {
  
  // MARK: Constants
  
  struct Metric {
    static let imageViewCornerRadius = CGFloat(16)
    
    static let buttonBorderWidth = CGFloat(0.5)
    static let buttonCornerRadius = CGFloat(5)
    
    static let ratingLabelBorderWidth = CGFloat(0.5)
  }
  
  struct Color {
    static let downloadButton = UIColor.rgb(red: 0, green: 129, blue: 250).cgColor
    static let ratingLabel = UIColor.darkGray.cgColor
  }
  
  
  // MARK: Properties
  
  var appDetailInfo: AppDetailInfo?
  
  
  // MARK: UI
  
  @IBOutlet weak var appNameLabel: UILabel!
  @IBOutlet weak var artistNameLabel: UILabel!
  @IBOutlet weak var appImageView: CustomImageView!
  @IBOutlet weak var downloadButton: UIButton!
  @IBOutlet weak var reviewCountLabel: UILabel!
  @IBOutlet weak var contentAdvisoryRatingLabel: UILabel!
  @IBOutlet weak var userRatingView: UserRatingView!
  
  
  // MARK: - View Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.appImageView.backgroundColor = .lightGray
    self.appImageView.layer.cornerRadius = Metric.imageViewCornerRadius
    self.appImageView.contentMode = .scaleAspectFill
    self.appImageView.layer.masksToBounds = true
    
    self.downloadButton.layer.borderWidth = Metric.buttonBorderWidth
    self.downloadButton.layer.borderColor = Color.downloadButton
    self.downloadButton.layer.cornerRadius = Metric.buttonCornerRadius
    
    self.contentAdvisoryRatingLabel.layer.borderWidth = Metric.ratingLabelBorderWidth
    self.contentAdvisoryRatingLabel.layer.borderColor = Color.ratingLabel
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
    
    if let userRating = self.appDetailInfo?.averageUserRating {
      self.userRatingView.rate = userRating
    }
    
  }
  
  
  // MARK: Action
  
  @IBAction func segmentedControlValueChanged(_ sender: Any) {
    
    // TODO: View Mode 변환( 3가지 )
  }
  
}
