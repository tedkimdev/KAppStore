//
//  AppListCell.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 3..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

final class AppListTableViewCell: UITableViewCell {

  // MARK: UI
  
  @IBOutlet weak var numberLabel: UILabel!
  @IBOutlet weak var appImageView: UIImageView!
  @IBOutlet weak var appNameLabel: UILabel!
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var reviewCountLabel: UILabel!
  @IBOutlet weak var downloadButton: UIButton!
  
  
  // MARK: Initializing
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.appImageView.backgroundColor = .clear
    self.appImageView.layer.cornerRadius = 8
    self.appImageView.contentMode = .scaleAspectFill
    self.appImageView.layer.masksToBounds = true
    
    self.downloadButton.layer.borderColor = self.downloadButton.tintColor.cgColor
    self.downloadButton.layer.borderWidth = 1
    self.downloadButton.layer.cornerRadius = 3
  }
  
  
  // MARK: Configuring
  
  func configure(app: App?, number: Int) {
    guard let app = app,
    let imageURL = app.imageURL else { return }
    
    self.numberLabel.text = "\(number)"
    self.appNameLabel.text = app.appName
    self.categoryLabel.text = app.category
    
    guard let url = URL(string: imageURL) else { return }
    URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
      guard let `self` = self else { return }
      
      if let error = error {
        print("Failed to load image: ", error)
        return
      }
      
      guard let imageData = data else { return }
      DispatchQueue.main.async {
        self.appImageView.image = UIImage(data: imageData)
      }
      
    }.resume()
    
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }

}
