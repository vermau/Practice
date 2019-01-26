//
//  ViewController.swift
//  SegmentedControl
//
//  Created by Ujjwal Verma on 26/1/19.
//  Copyright © 2019 Ujjwal Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        label.text = "\(sender.titleForSegment(at: segmentControl.selectedSegmentIndex) ?? "No Segment Selected") segment selected"
    }
    
    /*
     @objc func segmentSelected(_ sender: UISegmentedControl) {
        label.text = "\(sender.titleForSegment(at: segmentControl.selectedSegmentIndex) ?? "No Segment Selected") segment selected"
     } */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //segmentControl.addTarget(self, action: #selector(segmentSelected(_:)), for: .valueChanged)
    }


}

