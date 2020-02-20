//
//  OffersViewController+PresenterDelagate.swift
//  Luzaz
//
//  Created by jets on 12/17/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import UIKit
import IHProgressHUD
extension OffersViewController: OffersView {
    
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
    
    func getOffersSuccess() {
        
        presenter.isOfferEmpty = false
        presenter.configure{
            finish in
            if finish{
                DispatchQueue.global(qos: .default).async(execute: {
                    // time-consuming task
                    IHProgressHUD.dismiss()
                })
                self.collectionView.reloadData()
                
            }
        }
        
    }
    
    
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}

