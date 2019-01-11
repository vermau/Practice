//
//  NavVC.swift
//  Transitioning to other VCs
//
//  Created by Ben Sullivan on 30/12/2016.
//  Copyright © 2016 SullivanApplications. All rights reserved.
//

import UIKit

class NavVC: UIViewController {
  
  var emojis = allEmojis
}

extension NavVC: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return emojis.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    cell.textLabel?.text = emojis[indexPath.row]
    
    return cell
    
  }
}

extension NavVC: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    let vc = storyboard.instantiateViewController(withIdentifier: "detail")
    
    navigationController?.pushViewController(vc, animated: true)
  }
}
