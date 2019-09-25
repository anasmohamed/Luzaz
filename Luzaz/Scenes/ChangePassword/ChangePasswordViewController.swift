//
//  ChangePasswordViewController.swift
//  Luzaz
//
//  Created by jets on 1/25/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var rePasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var presenter: ChangePasswordPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ChangePasswordPresenter(view:self)
    }

    @IBAction func changePasswordBtnWasPressed(_ sender: Any) {
        if !((passwordTextField.text?.isEmpty)! && (rePasswordTextField.text?.isEmpty)!){
            presenter.setPasswordByToken(token:UserDefaults.standard.string(forKey: "token")! , password: passwordTextField.text!, rePassword: rePasswordTextField.text!)
        }
        else
        {
            showError(error: "should enter password and comfirm password")
        }
    }
}