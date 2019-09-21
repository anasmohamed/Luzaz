//
//  MyProductTableViewCell.swift
//  Luzaz
//
//  Created by jets on 1/18/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit
import SDWebImage
class MyProductTableViewCell: UITableViewCell,MyProductCellView {
    @IBOutlet weak var productQuntityLbl: UILabel!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func displayProductQuntity(quntity: String) {
        productQuntityLbl.text = quntity
    }
    func displayDate(date: String) {
        dateLbl.text = date
    }
    func displayProductName(productName: String) {
        productNameLbl.text = productName
    }
    func displayProductImage(image: String)
    {
        productImage.sd_setImage(with: URL(string: "http://luzaz.com/upload/\(image)"))
    }
    
}
