//
//  OrderTableViewCell.swift
//  Luzaz
//
//  Created by jets on 1/22/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit
import SDWebImage
class OrderTableViewCell: UITableViewCell,OrderCellView {
  

    @IBOutlet weak var orderQuntityLbl: UILabel!
    @IBOutlet weak var totalPriceLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var orderPriceLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func displayDate(date: String) {
        dateLbl .text = date
    }
    
    func displayProductTotalPrice(productTotalPrice: String) {
      totalPriceLbl.text = productTotalPrice
    }
    func displayProductPrice(price: String) {
        orderPriceLbl.text = price
    }
    func displayProductQuntity(quntity: String) {
        orderQuntityLbl.text = quntity
    }
}
