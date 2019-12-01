//
//  SellectedOfferImagesCollectionViewCell.swift
//  Luzaz
//
//  Created by Anas Mohamed on 11/16/19.
//  Copyright © 2019 Luzaz. All rights reserved.
//

import UIKit

class SellectedOfferImagesCollectionViewCell: UICollectionViewCell {
    
    var imageDeleteDelegate : ImageDeletable?
    @IBOutlet weak var offerImage: UIImageView!
    
    @IBOutlet weak var deleteButton : UIButton!
}
