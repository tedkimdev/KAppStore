//
//  ScreenShotCell.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 4..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class ScreenshotsCell: UICollectionViewCell {
  
  // MARK: Properties
  
  var screenshotURLs: [String]? {
    didSet {
      self.collectionView.reloadData()
    }
  }
  
  
  // MARK: UI
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var collectionView: UICollectionView!
  
  
  // MARK: Initializing
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  // MARK: - View Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.collectionView.dataSource = self
    self.collectionView.delegate = self
    self.collectionView.backgroundColor = .clear
  }
  
  func configure(URLs: [String]) {
    self.screenshotURLs = URLs
  }
  
}


// MARK: - UICollectionViewDataSource

extension ScreenshotsCell: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.screenshotURLs?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "screenshotImageCellId", for: indexPath) as! ScreenshotImageCell
    
    if let screenshotURL = self.screenshotURLs?[indexPath.item] {
      cell.configure(imageURL: screenshotURL)
    }
    
    return cell
    
  }
  
}


// MARK: - UICollectionViewDelegate

extension ScreenshotsCell: UICollectionViewDelegate {
  
}


// MARK: - UICollectionViewDelegateFlowLayout

extension ScreenshotsCell: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    //TODO: Size 함수 이미지셀 안에다 구현..
    // cell item 은 콜렉션뷰 높이 - (Section Insets top+bottom + Content Insets top + botoom)보다 작아야함.
    let height = self.frame.height - titleLabel.frame.height - 8 - 8 - 14 - 10
    let width = height * UIScreen.main.bounds.width / UIScreen.main.bounds.height
    return CGSize(width: width, height: height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 14, bottom: 14, right: 0)
  }
  
}
