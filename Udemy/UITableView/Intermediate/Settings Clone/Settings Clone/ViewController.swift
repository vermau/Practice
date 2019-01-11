//
//  ViewController.swift
//  Settings Clone
//
//  Created by Ben Sullivan on 25/01/2017.
//  Copyright © 2017 Ben Sullivan. All rights reserved.
//

import UIKit

class CurvedImage: UIImageView {
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    layer.cornerRadius = self.frame.width / 2
    clipsToBounds = true
  }
  
}

class TableVC: UITableViewController {
  
  
  override func viewDidLoad() {
  
self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
  }
  
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return UITableViewAutomaticDimension
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if section == 0 {
      let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100))
      headerView.backgroundColor = .yellow
      return headerView
    } else {
      return UIView()
    }
  }

}

