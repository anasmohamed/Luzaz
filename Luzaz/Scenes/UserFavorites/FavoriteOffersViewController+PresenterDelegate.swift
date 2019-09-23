//
//  FavoriteOffersViewController+PresenterDelegate.swift
//  Luzaz
//
//  Created by jets on 1/24/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import UIKit
extension FavoriteOffersViewController : FavoriteOffersView{
    func showError(error: String) {
        
    }
    func getFavoriteOffersSuccess() {
        tableView.reloadData()
    }
    func getMyOrdersSuccess() {
        tableView.reloadData()
        
    }
    func showIndicator() {
        
    }
    func hideIndicator() {
        
    }
}
