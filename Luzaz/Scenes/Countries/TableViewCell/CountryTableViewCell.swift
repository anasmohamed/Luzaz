//
//  LanguageTableViewCell.swift
//  Luzaz
//
//  Created by jets on 12/21/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell,CountryCellView {

    @IBOutlet weak var countryNameLable: UILabel!
    @IBOutlet weak var countryImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func displayCountryName(name: String) {
        countryNameLable.text = name.localiz()
    }
    func displayCountryImage(image: String) {
        countryImageView.image = UIImage(named: image)
    }
}
