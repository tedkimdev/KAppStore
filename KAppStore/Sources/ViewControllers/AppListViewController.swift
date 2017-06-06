//
//  ViewController.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 3..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

final class AppListViewController: UIViewController {
  
  // MARK: Constans
  
  struct Metric {
    static let apiResultLimit = 100
  }
  
  
  // MARK: Properties
  
  var isLoading: Bool = false
  var genre: Genre = .finance
  var apps: [App] = [App]()
  
  
  // MARK: UI
  
  @IBOutlet weak var tableView: UITableView!
  let refreshControl = UIRefreshControl()
  
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.title = "금융"
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "카테고리", style: .plain, target: self, action: #selector(leftBarButtonDidTap))
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon-card"), style: .plain, target: self, action: nil)
    
    self.tableView.dataSource = self
    self.tableView.delegate = self
    
    self.refreshControl.addTarget(self, action: #selector(refreshControlDidChangeValue), for: .valueChanged)
    
    self.tableView.addSubview(self.refreshControl)
    
    self.refreshControlDidChangeValue()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
  // MARK: Other Functions

  func loadAppList() {
    guard !self.isLoading else { return }
    self.isLoading = true
    ApiService.appList(limit: Metric.apiResultLimit, genre: self.genre.rawValue) { [weak self] response in
      guard let `self` = self else { return }
      self.isLoading = false
      self.refreshControl.endRefreshing()
      
      switch response {
      case .success(let apps):
        self.apps = apps
        self.tableView.reloadData()
        
      case .failure(let error):
        print("Failed to load app lists: ", error)
      }
    }
  }
  
  fileprivate dynamic func refreshControlDidChangeValue() {
    self.loadAppList()
  }
  
  fileprivate dynamic func leftBarButtonDidTap() {
    // TODO: 장르 선택 뷰 컨트롤러 present
  }
  
}


// MARK: - UITableViewDataSource

extension AppListViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.apps.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "appListCellId", for: indexPath) as! AppListTableViewCell
    
    let app = self.apps[indexPath.row]
    cell.configure(app: app, number: indexPath.row + 1)
    
    return cell
  }
  
}


// MARK: - UITableViewDelegate

extension AppListViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let appItem = self.apps[indexPath.row]
    guard let appDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "appDetailViewControllerId") as? AppDetailViewController else { return }
    appDetailViewController.appId = appItem.id
    
    self.navigationController?.pushViewController(appDetailViewController, animated: true)
  }
  
}
