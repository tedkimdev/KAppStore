//
//  ContentViewCell.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 5..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class ContentViewCell: UICollectionViewCell {
  
  // MARK: Constants
  
  struct Font {
    // 스토리보드 ContentLabel 폰트 크기
    static let contentLabel = UIFont.systemFont(ofSize: 12)
  }
  
  
  // MARK: UI
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var contentLabel: UILabel!
  
  
  // MARK: View Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  
  // MARK: Configuring
  
  func configure(title: String, content: String) {
    self.titleLabel.text = title
    self.contentLabel.text = content
    self.contentLabel.sizeToFit()
    self.setNeedsLayout()
  }
  
  
  // MARK: height
  
  class func height(width: CGFloat, description: String?) -> CGFloat {
    let height: CGFloat = 20 + 6 + 6 + 1
    let descriptionHeight = description?.size(width: width, font: Font.contentLabel).height ?? 0
    let minimumHeight = ceil(Font.contentLabel.lineHeight * 3) // 날짜 + 노트
    return height + max(descriptionHeight, minimumHeight) + 20 // cell 내부 insets
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.contentLabel.sizeToFit()
  }
  
  
}
