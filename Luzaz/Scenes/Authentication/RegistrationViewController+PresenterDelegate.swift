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
    
    func registrationSuccess(message: String) {
        showError(error: message,title : "Success")
        UserDefaults.standard.set(userNameTextField.text, forKey: "fullName")
      
    }
    
    func showError(error: String,title :String) {
        let alertController = UIAlertController(title: title.localiz(), message: error.localiz(), preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK".localiz(), style: .default){ UIAlertAction in
            self.dismiss(animated: true, completion: nil)

        }
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}
