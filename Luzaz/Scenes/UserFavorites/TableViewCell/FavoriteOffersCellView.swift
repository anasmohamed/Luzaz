//
//  FavoriteOffersCellView.swift
//  Luzaz
//
//  Created by jets on 1/24/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
protocol FavoriteOffersCellView {
    func displayDate(dateText: String)
    func displayOfferName(productName: String)
    func displayOfferPrice(price :String)
    func displayOfferImage(image: String)
}
