//
//  AppListCell.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 3..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

final class AppListCell: UITableViewCell {

  // MARK: UI
  
  @IBOutlet weak var numberLabel: UILabel!
  @IBOutlet weak var appIconView: UIImageView!
  @IBOutlet weak var appNameLabel: UILabel!
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var reviewCountLabel: UILabel!
  @IBOutlet weak var downloadButton: UIButton!
  
  
  // MARK: Initializing
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    
    self.downloadButton.layer.borderColor = self.downloadButton.tintColor.cgColor
    self.downloadButton.layer.borderWidth = 1
    self.downloadButton.layer.cornerRadius = 3
  }
  
  
  // MARK: Configuring
  
  func configure() {
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }

}
