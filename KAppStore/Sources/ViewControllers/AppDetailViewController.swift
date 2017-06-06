//
//  AppDetailViewController.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 3..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

class AppDetailViewController: UICollectionViewController {
  
  // MARK: Constants
  
  struct Metric {
    static let headerHeight = CGFloat(180)
    static let footerHeight = CGFloat(40)
    static let selectableCellHeight = CGFloat(40)
  }
  
  // MARK: Properties
  
  fileprivate var cellTypes: CellType = CellType(
    items: [
      .screenshot,
      .content(title: "description"),
      .content(title: "releaseNotes"),
      .information,
      .selectable(title: "버전 업데이트 기록"),
      .selectable(title: "개발자 웹사이트"),
      .selectable(title: "개인정보 취급방침"),
      .selectable(title: "개발자 앱"),
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
    
    switch kind {
    case UICollectionElementKindSectionHeader:
      let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as! AppDetailHeader
      if let appDetailInfo = self.appDetailInfo {
        header.configure(appDetailInfo: appDetailInfo)
      }
      return header
      
    case UICollectionElementKindSectionFooter:
      let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footerId", for: indexPath) as! AppDetailFooter
      if let appDetailInfo = self.appDetailInfo, let artistName = appDetailInfo.artistName {
        footer.configure(artistName: artistName)
      }
      return footer
      
    default:
      return UICollectionReusableView()
    }
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.cellTypes.items.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    switch self.cellTypes.items[indexPath.item] {
      
    case .screenshot:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "screenshotsCellId", for: indexPath) as! ScreenshotsCell
      
      if let screenshotURLs = self.appDetailInfo?.screenshotURLs {
        
        cell.configure(URLs: screenshotURLs)
      }
      return cell
      
    case .content(let title):
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentCellId", for: indexPath) as! ContentViewCell
      if let description = self.appDetailInfo?.description,
        title == "description" {
        cell.configure(title: "설명", content: description)
        
      } else if let releaseNotes = self.appDetailInfo?.releaseNotes,
        let releaseDate = self.appDetailInfo?.releaseDate,
        title == "releaseNotes" {
        cell.configure(title: "새로운 기능", content: Date.convertISODateStringToDate(string: releaseDate) + "\n\n" + releaseNotes)
      }
      return cell
      
    case .information:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "informationCellId", for: indexPath) as! InfomationCell
      
      if let dictionary = self.appDetailInfo?.informationCellData() {
        cell.configure(title: "정보", dictionary: dictionary)
      }
      
      return cell
      
    case .selectable(let title):
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectableCellId", for: indexPath) as! SelectableCell
      cell.configure(title: title)
      return cell
      
    default:
      return UICollectionViewCell()
    }
    
  }
  
}


// MARK: - UICollectionViewDelegateFlowLayout

extension AppDetailViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: self.view.frame.width, height: Metric.headerHeight)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    return CGSize(width: self.view.frame.width, height: Metric.footerHeight)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    switch self.cellTypes.items[indexPath.item] {
    case .content(let title):
      var height: CGFloat = 0
      if title == "description" {
        height = ContentViewCell.height(width: self.view.frame.width, description: self.appDetailInfo?.description)
      } else if title == "releaseNotes" {
        height = ContentViewCell.height(width: self.view.frame.width, description: self.appDetailInfo?.releaseNotes)
      }
      return CGSize(width: self.view.frame.width, height: height)
      
    case .selectable:
      return CGSize(width: self.view.frame.width, height: Metric.selectableCellHeight)
    
    case .information:
      if let dictionary = self.appDetailInfo?.informationCellData(),
        let key = dictionary.first?.key
        {
          let height = InfomationCell.height(width: self.view.frame.width, description: key)
          return CGSize(width: self.view.frame.width, height: height)
      }
      let height = InfomationCell.height(width: self.view.frame.width, description: "")
      return CGSize(width: self.view.frame.width, height: height)
      
    default:
      return CGSize(width: self.view.frame.width, height: 360)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0.5
  }
  
}
