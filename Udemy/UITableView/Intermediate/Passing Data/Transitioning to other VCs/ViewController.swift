//
//  ViewController.swift
//  Transitioning to other VCs
//
//  Created by Ben Sullivan on 02/12/2016.
//  Copyright © 2016 SullivanApplications. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
  
  var checklist = ["Subclass UITableViewDatasource",
                   "Create a prototype cell",
                   "Set a unique reuse identifier",
                   "Wire the tableView to the ViewController",
                   "Add number of rows",
                   "Add cellForRowAt"
  ]
}

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return checklist.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = UITableViewCell()
    
    cell.textLabel?.text = checklist[indexPath.row]
    
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    performSegue(withIdentifier: "segue1", sender: nil)
    
  }
}
