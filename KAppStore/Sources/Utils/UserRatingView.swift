//
//  UserRatingView.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 6..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class UserRatingView: UIView {
  
  // MARK: Constants
  
  struct Metric {
    static let spacing: CGFloat = 2
    static let maxRate: Int = 5
  }

  // MARK: Properties
  
  var rate: Float? = 0 {
    didSet {
      self.drawStar()
    }
  }
  
  
  // MARK: Initializing
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    self.backgroundColor = .clear
  }
  
  fileprivate func drawStar() {
    guard let rating = self.rate, rating > 0 else { return }
    
    let width = self.frame.size.height
    let userRating = CGFloat(rating)
    
    for i in 0..<Metric.maxRate {
      let index = CGFloat(i)
      let imageFrame = CGRect(x: (width + Metric.spacing) * index,
                              y: 0,
                              width: width,
                              height: width)
      if index < userRating {
        if 0 < floor(userRating - index) {
          let imageView = UIImageView(image: #imageLiteral(resourceName: "icon-star-fill"))
          imageView.frame = imageFrame
          self.addSubview(imageView)
        } else {  // 음수일 때, 별 반개
          let imageView = UIImageView(image: #imageLiteral(resourceName: "icon-star-half"))
          imageView.frame = imageFrame
          self.addSubview(imageView)
        }
      } else {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "icon-star-empty"))
        imageView.frame = imageFrame
        //          self.starImages.append(self.halfStarImage)
        self.addSubview(imageView)
      }
    }
  }
  
}


