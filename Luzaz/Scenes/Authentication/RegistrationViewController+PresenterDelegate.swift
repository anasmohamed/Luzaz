//
//  RegistrationViewController+PresenterDelegate.swift
//  Luzaz
//
//  Created by jets on 12/24/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import UIKit

extension RegisterViewController: RegistrationView {
    
    func showIndicator() {
        spinner.startAnimating()
    }
    
    func hideIndicator() {
        spinner.stopAnimating()
    }
    
    func registrationSuccess() {
        UserDefaults.standard.set(userNameTextField.text, forKey: "fullName")
        dismiss(animated: true, completion: nil)
    }
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error".localiz(), message: error.localiz(), preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK".localiz(), style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}
