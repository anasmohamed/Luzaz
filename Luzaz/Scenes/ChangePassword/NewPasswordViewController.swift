//
//  NewPassword.swift
//  Luzaz
//
//  Created by Anas Mohamed on 2/29/20.
//  Copyright © 2020 Luzaz. All rights reserved.
//

import UIKit

class NewPasswordViewController: UIViewController ,ResetPasswordView{
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var tekenTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextFiled: UITextField!
    
    var email : String?
    var presenter: ResetPasswordPresenter!

       override func viewDidLoad() {
           super.viewDidLoad()
          presenter = ResetPasswordPresenter(view:self)
       }
    
    @IBAction func resetPasswordBtnWasPressed(_ sender: Any) {
        
        if !passwordTextField.text!.isEmpty && !confirmPasswordTextFiled.text!.isEmpty
            && !emailTextField.text!.isEmpty && !tekenTextField.text!.isEmpty{
            
            
        }
    }
 func showIndicator() {
        spinner.startAnimating()
    }
    
    func hideIndicator() {
        spinner.stopAnimating()
    }
    
    
    func resetPasswordSuccess(message: String) {
        showError(error:message)
              let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
              present(loginVC, animated: true, completion: nil)
    }
    
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error".localiz(), message: error.localiz(), preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK".localiz(), style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
