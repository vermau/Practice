//
//  StickyHeaders.swift
//  Headers & Footers
//
//  Created by Ujjwal Verma on 18/12/18.
//  Copyright © 2018 Ben Sullivan. All rights reserved.
//

import UIKit

class StickyHeaders: UIViewController {
    let headerHeight: CGFloat = 150
    var headerView = UIView()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupHeader()
    }
    
    private func setupHeader() {
        headerView = tableView.tableHeaderView!
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        tableView.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -headerHeight)
    }
    
    private func updateHeader() {
        
    }
    
}

extension StickyHeaders: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Unicorn"
        
        return cell
    }
}

extension StickyHeaders: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeader()
    }
}
