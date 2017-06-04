//
//  ScreenShotCell.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 4..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class ScreenshotsCell: UICollectionViewCell {
  
  // MARK: UI
  
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
  
}


// MARK: - UICollectionViewDataSource

extension ScreenshotsCell: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
    
    cell.backgroundColor = .green
    
    return cell
    
  }
  
}


// MARK: - UICollectionViewDelegate

extension ScreenshotsCell: UICollectionViewDelegate {
  
}


// MARK: - UICollectionViewDelegateFlowLayout

extension ScreenshotsCell: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 200, height: self.frame.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
  }
  
}
