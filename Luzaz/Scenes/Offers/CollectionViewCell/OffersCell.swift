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
   var indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var offerImageView: UIImageView!
    var imageHieght : CGFloat?
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.layer.masksToBounds = true

        self.layer.cornerRadius = 10
        indicator.center = self.center
indicator.hidesWhenStopped = true
        indicator.style = UIActivityIndicatorView.Style.gray
        self.addSubview(indicator)

        indicator.startAnimating()
//customize yourself
        
        // Initialization code
    }
    func displayOfferImage(offerImage: String)  {
         offerImageView.sd_setImage(with: URL(string: "http://luzaz.com/upload/\(offerImage)"), completed: {  (image, error, cacheType, url) in
          if image  != nil
          {
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
            }
            
            }
             
         })
         
    }
    
}
    
        
    




