//
//  OffersTableViewCell.swift
//  Luzaz
//
//  Created by jets on 12/16/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import UIKit
import SDWebImage
class OffersTableViewCell: UITableViewCell,OffersCellView {

    @IBOutlet weak var offerImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func displayOfferImage(offerImage: String) {
        offerImageView.sd_setImage(with: URL(string: "http://luzaz.com/upload/\(offerImage)"), placeholderImage: UIImage(named: "back.png"))

    }
}
