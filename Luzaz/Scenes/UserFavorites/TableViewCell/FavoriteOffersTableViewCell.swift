//
//  FavoriteOffersTableViewCell.swift
//  Luzaz
//
//  Created by jets on 1/24/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit
import SDWebImage
class FavoriteOffersTableViewCell: UITableViewCell,FavoriteOffersCellView {
    @IBOutlet weak var favoriteOfferName: UILabel!

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var favoriteOfferPrice: UILabel!
    @IBOutlet weak var favoriteOfferImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func displayDate(dateText: String) {
        date.text = dateText
        
    }
    func displayOfferImage(image: String) {
        favoriteOfferImage.sd_setImage(with: URL(string: "http://luzaz.com/upload/\(image)"))
    }
    func displayOfferPrice(price: String) {
        favoriteOfferPrice.text = price
    }
    func displayOfferName(productName: String) {
        favoriteOfferName.text = productName
        
    }
}
