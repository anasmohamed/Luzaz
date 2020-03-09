//
//  RegistrationViewController+PresenterDelegate.swift
//  Luzaz
//
//  Created by jets on 12/24/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import UIKit
import Toast_Swift
extension RegisterViewController: RegistrationView {
  
    
    func showIndicator() {
        spinner.startAnimating()
    }
    
    func hideIndicator() {
        spinner.stopAnimating()
    }
    
    func registrationSuccess(message: String) {
        self.view.makeToast(message, duration: 3.0, position: .bottom)
        UserDefaults.standard.set(userNameTextField.text, forKey: "fullName")
    let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
    present(loginVC, animated: true, completion: nil)
      
    }
    
    func showError(error: String,title :String) {
        let alertController = UIAlertController(title: title.localiz(), message: error.localiz(), preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK".localiz(), style: .default)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}
