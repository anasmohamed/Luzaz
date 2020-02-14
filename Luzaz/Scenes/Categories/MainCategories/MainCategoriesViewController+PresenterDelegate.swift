//
//  MainCategoriesViewController+.swift
//  Luzaz
//
//  Created by jets on 1/11/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import UIKit
import IHProgressHUD

extension MainCateogriesViewController : MainCategoriesView
{
    func showIndicator() {
        IHProgressHUD.show()
        spinner.startAnimating()
    }
    
    func hideIndicator() {
        DispatchQueue.global(qos: .default).async(execute: {
              // time-consuming task
              IHProgressHUD.dismiss()
              })
        spinner.stopAnimating()
    }
    
    func getMainCategoriesSuccess() {
        collectionView.reloadData()
    }
    
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}
