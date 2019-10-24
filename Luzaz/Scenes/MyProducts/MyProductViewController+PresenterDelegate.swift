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
    func offerDeletedSuccessfuly(message: String) {
        showALert(message: "offer deleted successfully", title: "Delete")
    }
    
    func showError(error: String) {
        showALert(message: error, title: "Error")
        
    }
    func showALert(message : String,title: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    func getMySellingProductsSuccess() {
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
