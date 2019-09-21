//
//  MyProductViewController+PresenterDelegate.swift
//  Luzaz
//
//  Created by jets on 1/18/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import UIKit

extension MyProductViewController : MyProductView
{
    func showError(error: String) {
        
    }
    func getMySellingProductsSuccess() {
      tableView.reloadData()
    }
    func showIndicator() {
        
    }
    func hideIndicator() {
        
    }
}
