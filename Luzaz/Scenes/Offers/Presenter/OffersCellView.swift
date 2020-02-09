//
//  OffersCellView.swift
//  Luzaz
//
//  Created by jets on 12/16/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import UIKit
protocol OffersCellView {
    func displayOfferImage(offerImage : String,collectionView : UICollectionView, completion: @escaping (CGFloat) -> Void)
    func displayOfferImage(offerImage : String, completion: @escaping (CGFloat) -> Void)
    func getImageHeight(image:UIImage) -> CGFloat
    func getHeight() -> CGFloat
}
