//
//  SubCategoryOffersTableViewCell.swift
//  Luzaz
//
//  Created by jets on 1/16/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit
import SDWebImage
class SubCategoryOffersTableViewCell: UITableViewCell,SubCategoryOffersCellView {
    @IBOutlet weak var productNameLbl: UILabel!

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func showProductName(name: String) {
        productNameLbl.text = name
    }
    func showProductDate(date: String) {
        dateLbl.text = date
    }
    func showProductImage(image: String) {
        productImageView.sd_setImage(with: URL(string: "http://luzaz.com/upload/\(image)"), placeholderImage: UIImage(named: "back.png"))
    }
    func showProductNumber(number: String) {
        numberLbl.text = number
    }
}