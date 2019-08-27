//
//  LoginViewController+PresenterDelegate.swift
//  Luzaz
//
//  Created by jets on 12/24/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
extension LoginViewController: LoginView {
    
    func showIndicator() {
        spinner.startAnimating()
    }
    
    func hideIndicator() {
        spinner.stopAnimating()
    }
    
    func loginSuccess(user:User) {
//        let storyboard = storyboard(name: "Main", bundle: Bundle.main)
//        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
//        let encodeData:Data = NSKeyedArchiver.archivedData(withRootObject: user)
//        UserDefaults.standard.set(encodeData, forKey:"user")
//        
//        present(homeViewController, animated: true, completion: nil)
    }
    
    func showError(error: String) {
//        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
//        
//        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alertController.addAction(action)
//        
//        present(alertController, animated: true, completion: nil)
    }
}