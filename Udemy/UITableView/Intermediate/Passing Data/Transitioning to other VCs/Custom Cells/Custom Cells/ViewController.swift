//
//  ViewController.swift
//  Custom Cells
//
//  Created by Ben Sullivan on 02/12/2016.
//  Copyright © 2016 SullivanApplications. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, DataService {
  
  @IBOutlet weak var tableView: UITableView!

  var countries = [Country]()

  override func viewDidLoad() {
    
    countries = createCountries()!
    
//    tableView.estimatedRowHeight = 100
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }

}

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return countries.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
    let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
    
    cell.configureCell(country: countries[indexPath.row])
    
    return cell
  }
}
