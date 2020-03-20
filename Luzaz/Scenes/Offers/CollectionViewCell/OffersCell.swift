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
    var actInd: UIActivityIndicatorView?
    var imageHieght : CGFloat?
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.layer.masksToBounds = true
        
       self.layer.cornerRadius = 10
    
       
      //  self.addSubview(actInd!)
    //    actInd!.startAnimating()
        //customize yourself
        
        // Initialization code
    }
    func displayOfferImage(offerImage: String)  {
        
        offerImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
        offerImageView.sd_imageIndicator = SDWebImageProgressIndicator.default
        offerImageView.sd_setImage(with: URL(string: "http://luzaz.com/upload/\(offerImage)"))
    }
    
}







