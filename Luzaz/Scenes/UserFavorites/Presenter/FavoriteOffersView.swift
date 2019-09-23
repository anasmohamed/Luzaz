//
//  FavoriteOffersView.swift
//  Luzaz
//
//  Created by jets on 1/24/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
protocol FavoriteOffersView:class {
    func showIndicator()
    func hideIndicator()
    func getFavoriteOffersSuccess()
    func showError(error: String)
}
