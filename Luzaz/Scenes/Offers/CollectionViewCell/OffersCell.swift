//
//  OffersCell.swift
//  Luzaz
//
//  Created by jets on 12/17/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import UIKit
import SDWebImage
class OffersCell: UICollectionViewCell,OffersCellView {

    @IBOutlet weak var offerImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10 //customize yourself
        self.layer.masksToBounds = true
        // Initialization code
    }
    func displayOfferImage(offerImage: String) {
        offerImageView.sd_setImage(with: URL(string: "http://luzaz.com/upload/\(offerImage)"), placeholderImage: UIImage(named: "back.png"))
        
    }
}
