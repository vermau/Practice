//
//  FlagCell.swift
//  Custom Cells
//
//  Created by Ujjwal Verma on 10/12/18.
//  Copyright © 2018 Ben Sullivan. All rights reserved.
//

import UIKit

class FlagCell: UITableViewCell {
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    
    var country: Country! {
        didSet {
            configureCell()
        }
    }
    
    @IBAction func togglePressed(_ sender: UIButton) {
        countryName.text = countryName.text == country.name ? country.cont.rawValue : country.name
    }
    
    func configureCell() {
        countryName.text = country.name
        flagImage.image = UIImage(named: country.flag)
    }
}
