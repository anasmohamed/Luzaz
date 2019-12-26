//
//  ForgetPasswordViewController.swift
//  Luzaz
//
//  Created by Anas Mohamed on 12/10/19.
//  Copyright © 2019 Luzaz. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController, ChangePasswordView{
    func showIndicator() {
          spinner.startAnimating()
      }
      
      func hideIndicator() {
          spinner.stopAnimating()
      }
      
      func changePasswordSuccess(message:String) {
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

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var emailTextField: UITextField!
    var peresnter : ChangePasswordPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        peresnter = ChangePasswordPresenter(view:self)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func forgetPasswordBtnWasPressed(_ sender: Any) {
        if !emailTextField.text!.isEmpty
        {
            peresnter?.forgetPassword(email:emailTextField.text!)
        }else
        {
            showError(error: "you should enter your email")
        }
    }
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
