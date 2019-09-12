//
//  SubCategoriesViewConteroller+PresenterDelegate.swift
//  Luzaz
//
//  Created by jets on 1/12/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import UIKit

extension SubCategoriesViewController : SubCategoriesView
{
    func showIndicator() {
        spinner.startAnimating()
    }
    
    func hideIndicator() {
        spinner.stopAnimating()
    }
    
    func getSubCategoriesSuccess() {
        tableView.reloadData()
    }
    
    
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }

}
