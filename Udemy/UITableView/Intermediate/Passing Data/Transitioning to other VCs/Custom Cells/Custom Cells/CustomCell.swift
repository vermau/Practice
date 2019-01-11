//
//  CustomCell.swift
//  Custom Cells
//
//  Created by Ben Sullivan on 02/12/2016.
//  Copyright © 2016 SullivanApplications. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
  
  @IBOutlet weak var flagImage: UIImageView!
  @IBOutlet weak var countryName: UILabel!
  @IBOutlet weak var capitalCity: UILabel!
  
  func configureCell(country: Country) {
    
    flagImage.image = UIImage(named: country.flag)
    countryName.text = country.name
    capitalCity.text = country.capital
  }
  
}
