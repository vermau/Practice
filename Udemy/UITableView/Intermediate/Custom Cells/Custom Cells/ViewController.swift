//
//  ViewController.swift
//  Custom Cells
//
//  Created by Ben Sullivan on 04/01/2017.
//  Copyright © 2017 Ben Sullivan. All rights reserved.
//

import UIKIT

class ViewController: UIViewController, DataService {
    @IBOutlet weak var tableView: UITableView!
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 300
        tableView.estimatedRowHeight = 300
        
        countries = createCountries()!
        
        for country in countries {
            print(country.name)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Images of Flags"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FlagCell

        cell.country = countries[indexPath.row]

        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row: \(indexPath.row + 1)")
    }
}
