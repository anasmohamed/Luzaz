//
//  ConversationViewController+PresenterDelegate.swift
//  Luzaz
//
//  Created by jets on 1/14/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//


import UIKit
import Foundation
extension ConverstionViewController : ConversationView {
    func getConversationSuccess() {
        tableView.reloadData()
    }
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    func addConversationSucces() {
        tableView.reloadData()
    }
}
