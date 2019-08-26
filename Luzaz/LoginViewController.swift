//
//  LoginViewController.swift
//  Luzaz
//
//  Created by Salwa on 4/30/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
  
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var presenter: LoginPresenter!
    @IBOutlet weak var scroller: UIScrollView!
 
    @IBAction func loginBtnWasPressed(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        presenter.login(email: email, password: password)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(view: self)
        scroller.translatesAutoresizingMaskIntoConstraints = false
        scroller.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scroller.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scroller.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scroller.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        // Do any additional setup after loading the view.
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    

}
