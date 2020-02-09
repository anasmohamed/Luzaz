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
    var imageHieght : CGFloat?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10 //customize yourself
        
        //self.layer.masksToBounds = true
        // Initialization code
    }
    func displayOfferImage(offerImage: String,collectionView:UICollectionView,completion : @escaping (CGFloat) -> Void)  {
        //        offerImageView.sd_setImage(with: URL(string: "http://luzaz.com/upload/\(offerImage)"), placeholderImage: UIImage(named: "back.png"))
        offerImageView.sd_setImage(with: URL(string: "http://luzaz.com/upload/\(offerImage)"), completed: {  (image, error, cacheType, url) in
            UIView.animate(withDuration:0.3, animations: {
                
                self.imageHieght =  self.getImageHeight(image: image!)
                completion(self.imageHieght!)
                collectionView.collectionViewLayout.invalidateLayout()
            }
            )
            
        })
        
    }
    func displayOfferImage(offerImage: String,completion : @escaping (CGFloat) -> Void)  {
           //        offerImageView.sd_setImage(with: URL(string: "http://luzaz.com/upload/\(offerImage)"), placeholderImage: UIImage(named: "back.png"))
    
//           offerImageView.sd_setImage(with: URL(string: "http://luzaz.com/upload/\(offerImage)"), completed: {  (image, error, cacheType, url) in
//               UIView.animate(withDuration:0.3, animations: {
//
//                   self.imageHieght =  self.getImageHeight(image: image!)
//                   completion(self.imageHieght!)
//               }
//               )
//
//           })
           
       }
    func getHeight() -> CGFloat
    {
        return imageHieght!
    }
    func getImageHeight(image: UIImage) -> CGFloat {
        return image.size.height
    }
}

