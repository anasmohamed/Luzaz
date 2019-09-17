//
//  OffersDetailesView.swift
//  Luzaz
//
//  Created by jets on 1/17/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
protocol OfferDetailesView :class{
    func addProductToFavoriteSuccess(message:String)
    func showError(error: String)
}
