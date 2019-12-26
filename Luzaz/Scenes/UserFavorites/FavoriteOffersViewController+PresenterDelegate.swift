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
    func offerDeletedSuccessfuly(message: String) {
        showALert(message: "Offer Deleted Successfully", title: "Seccess")
    }
    
    func showError(error: String) {
        showALert(message: error, title:"Error")
    }
    func showALert(message : String,title: String)
      {
        let alertController = UIAlertController(title: title.localiz(), message: message.localiz(), preferredStyle: .alert)
          
          let action = UIAlertAction(title: "OK".localiz(), style: .default, handler: nil)
          alertController.addAction(action)
          
          present(alertController, animated: true, completion: nil)
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
