//
//  LoginViewController.swift
//  Luzaz
//
//  Created by Salwa on 4/30/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit
import Alamofire
import SwiftValidator
class LoginViewController: UIViewController, ValidationDelegate, UITextFieldDelegate{
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        
    }
    
    let appDelegate = AppDelegate.getAppDelegate()
    let validator = Validator()
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var forgetPasswordLbl: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
        {
        didSet {
            emailTextField.tintColor = UIColor.lightGray
            emailTextField.setIcon(UIImage(named: "user")!)
        }
    }
    @IBOutlet weak var passwordTextField: UITextField!
        {
        didSet {
            passwordTextField.tintColor = UIColor.lightGray
            passwordTextField.setIcon(UIImage(named: "lock")!)
        }
    }
    
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var presenter: LoginPresenter!
    @IBOutlet weak var scroller: UIScrollView!
    
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
      //  appDelegate.MenuContainerVC.toggleLeftPane()
        
    }
    func validationSuccessful() {
        print("Validation Success!")
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        presenter.login(email: email, password: password)
        
    }
    
    @IBAction func loginBtnWasPressed(_ sender: Any) {
        validator.validate(self)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(view: self)
        emailTextField.placeholderColor(.darkGray)
        passwordTextField.placeholderColor(.darkGray)
        
        validator.styleTransformers(success:{ (validationRule) -> Void in
            print("here")
            // clear error label
            validationRule.errorLabel?.isHidden = true
            validationRule.errorLabel?.text = ""
            
            if let textField = validationRule.field as? UITextField {
                textField.layer.borderColor = UIColor.green.cgColor
                textField.layer.borderWidth = 0.5
            } else if let textField = validationRule.field as? UITextView {
                textField.layer.borderColor = UIColor.green.cgColor
                textField.layer.borderWidth = 0.5
            }
        }, error:{ (validationError) -> Void in
            print("error")
            validationError.errorLabel?.isHidden = false
            validationError.errorLabel?.text = validationError.errorMessage.localiz()
            if let textField = validationError.field as? UITextField {
                textField.layer.borderColor = UIColor.red.cgColor
                textField.layer.borderWidth = 1.0
            } else if let textField = validationError.field as? UITextView {
                textField.layer.borderColor = UIColor.red.cgColor
                textField.layer.borderWidth = 1.0
            }
        })
        // You can pass in error labels with your rules
        // You can pass in custom error messages to regex rules (such as ZipCodeRule and EmailRule)
        validator.registerField(emailTextField, errorLabel: emailErrorLabel, rules: [RequiredRule(), EmailRule()])
        
        validator.registerField(passwordTextField, errorLabel: passwordErrorLabel, rules: [RequiredRule(), PasswordRule(regex:"^[A-Za-z\\d$@$#!%*?&]{5,}")])
        
        
        
        // You can unregister a text field if you no longer want to validate it
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Back", style: .plain, target: nil, action: nil)
       // scroller.translatesAutoresizingMaskIntoConstraints = false
        //scroller.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //scroller.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        //scroller.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //scroller.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    
    @objc func forgetPasswordWasPressed()
    {
        let forgetPasswordVC = storyboard?.instantiateViewController(withIdentifier: "ForgetPasswordViewController")
        forgetPasswordVC?.modalPresentationStyle = .fullScreen
        self.present(forgetPasswordVC!,animated: true,completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        validator.validateField(textField){ error in
            if error == nil {
                // Field validation was successful
            } else {
                // Validation error occurred
            }
        }
        return true
    }
}

