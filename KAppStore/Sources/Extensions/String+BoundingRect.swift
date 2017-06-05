//
//  String+BoundingRect.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 5..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

extension String {
  
  func size(width: CGFloat, font: UIFont, numberOfLines: Int = 0) -> CGSize {
    let maximumHeight = numberOfLines == 0
      ? CGFloat.greatestFiniteMagnitude
      : font.lineHeight * CGFloat(numberOfLines)
    let constraintSize = CGSize(width: width - 20, height: maximumHeight)
    let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
    let attributes: [String: Any] = [NSFontAttributeName: font]
    let boundingRect = self.boundingRect(
      with: constraintSize,
      options: options,
      attributes: attributes,
      context: nil
    )
    
    return CGSize(width: ceil(boundingRect.width), height: ceil(boundingRect.height))
  }
  
  func boundingRect(width: CGFloat, font: UIFont, numberOfLines: Int = 0) -> CGRect {
    let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
    var rect = self.boundingRect(
      with: size,
      options: [.usesFontLeading, .usesLineFragmentOrigin],
      attributes: [NSFontAttributeName: font],
      context: nil
    )
    rect.size.width = ceil(rect.width)
    if numberOfLines > 0 {
      rect.size.height = min(rect.height, font.lineHeight * CGFloat(numberOfLines))
    }
    rect.size.height = ceil(rect.height)
    return rect
  }
  
  func height(width: CGFloat, font: UIFont, numberOfLines: Int = 0) -> CGFloat {
    return self.boundingRect(width: width, font: font, numberOfLines: numberOfLines).height
  }
  
}
