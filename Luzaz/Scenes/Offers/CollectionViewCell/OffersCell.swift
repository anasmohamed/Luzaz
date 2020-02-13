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
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var offerImageView: UIImageView!
    var imageHieght : CGFloat?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10 //customize yourself
        
        //self.layer.masksToBounds = true
        // Initialization code
    }
    func displayOfferImage(offerImage: String)  {
        indicator.startAnimating()
         offerImageView.sd_setImage(with: URL(string: "http://luzaz.com/upload/\(offerImage)"), completed: {  (image, error, cacheType, url) in
          if image  != nil
          {
            
            self.indicator.stopAnimating()
            }
             
         })
         
    }
    
}
    
        
    




