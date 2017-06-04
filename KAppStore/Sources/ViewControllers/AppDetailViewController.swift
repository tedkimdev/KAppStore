//
//  AppDetailViewController.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 3..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class AppDetailViewController: UICollectionViewController {
  
  // MARK: Properties
  
  fileprivate var cellTypes: CellType = CellType(
    items:[.screenshot,
           .content,
           .information,
           .selectable,
           .artistName,
          ]
  )
  
  var appId: String? {
    didSet {
      guard let appId = self.appId else { return }
      ApiService.appDetail(appId: appId) { [weak self] appDetailInfo in
        guard let `self` = self else { return }
        self.appDetailInfo = appDetailInfo
      }
    }
  }
  
  var appDetailInfo: AppDetailInfo? {
    didSet {
//      print(self.appDetailInfo ?? "no app detail info")
      self.collectionView?.reloadData()
    }
  }
  
  
  // MARK: Initializing
  
  required init?(coder: NSCoder)  {
    super.init(coder: coder)
  }
  
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  // MARK: UICollectionViewDataSource
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as! AppDetailHeader
    
    if let appDetailInfo = self.appDetailInfo {
      header.configure(appDetailInfo: appDetailInfo)
    }
    
    return header
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.cellTypes.items.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    switch self.cellTypes.items[indexPath.item] {
    case .screenshot:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "screenshotsCellId", for: indexPath) as! ScreenshotsCell
      
      if let screenshotURLs = self.appDetailInfo?.screenshotURLs {
//        print(screenshotURLs)
        cell.configure(URLs: screenshotURLs)
      }
      return cell
      
    case .content:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentCellId", for: indexPath)
      cell.backgroundColor = .green
      return cell
      
    case .information:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentCellId", for: indexPath)
      cell.backgroundColor = .blue
      return cell
      
    case .selectable:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentCellId", for: indexPath)
      cell.backgroundColor = .green
      return cell
      
    case .artistName:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentCellId", for: indexPath)
      cell.backgroundColor = .blue
      return cell
    }
    
  }
  
}


// MARK: - UICollectionViewDelegateFlowLayout

extension AppDetailViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: self.view.frame.width, height: 180)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.view.frame.width, height: 360)
  }
  
}
