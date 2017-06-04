//
//  ViewController.swift
//  KAppStore
//
//  Created by aney on 2017. 6. 3..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

final class AppListViewController: UIViewController {
  
  // MARK: Properties
  
  var apps: [App] = [App]()
  
  
  // MARK: UI
  
  @IBOutlet weak var tableView: UITableView!
  
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.title = "금융"
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "카테고리", style: .plain, target: self, action: nil)
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon-card"), style: .plain, target: self, action: nil)
    
    self.tableView.dataSource = self
    self.tableView.delegate = self
    
    self.loadAppList()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  // MARK: Other Functions

  func loadAppList() {
    self.apps = App.sampleAppList()
    self.tableView.reloadData()
    
    ApiService.appList { [weak self] appArray in
      guard let `self` = self else { return }
      self.apps = appArray
      self.tableView.reloadData()
    }
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
    print("\(indexPath.row) selected ")
    
//    let appItem = self.appItems[indexPath.item]
    guard let appDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "appDetailViewControllerId") else { return }
    self.navigationController?.pushViewController(appDetailViewController, animated: true)

  }
  
}
