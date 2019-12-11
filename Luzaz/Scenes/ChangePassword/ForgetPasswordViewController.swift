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
        
    }
    
    func hideIndicator() {
        
    }
    
    func changePasswordSuccess(message: String) {
        
    }
    
    func showError(error: String) {
        
    }
    

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
