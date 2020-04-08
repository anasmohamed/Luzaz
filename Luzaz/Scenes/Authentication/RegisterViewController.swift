//
//  RegisterViewController.swift
//  Luzaz
//
//  Created by jets on 12/1/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import UIKit
import Alamofire
import BEMCheckBox
import Toast_Swift
import SwiftValidator
class RegisterViewController: UIViewController ,ValidationDelegate, UITextFieldDelegate{
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        
    }
    
    @IBOutlet weak var agreeCheckBoc: BEMCheckBox!
    let validator = Validator()
    @IBOutlet weak var phoneErrorLabel: UILabel!
    @IBOutlet weak var confirmPasswordErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var fullNameErrorLabel: UILabel!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var mobileTextField: UITextField!
        {
        didSet {
            mobileTextField.tintColor = UIColor.lightGray
            mobileTextField.setIcon(UIImage(named: "phone")!)
        }
    }
    @IBOutlet weak var conPassTextField: UITextField!
        {
        didSet {
            conPassTextField.tintColor = UIColor.lightGray
            conPassTextField.setIcon(UIImage(named: "lock")!)
        }
    }
    @IBOutlet weak var passwordTextField: UITextField!
        {
        didSet {
            passwordTextField.tintColor = UIColor.lightGray
            passwordTextField.setIcon(UIImage(named: "lock")!)
        }
    }
    @IBOutlet weak var emailTextField: UITextField!
        {
        didSet {
            emailTextField.tintColor = UIColor.lightGray
            emailTextField.setIcon(UIImage(named: "envelope")!)
        }
    }
    @IBOutlet weak var userNameTextField: UITextField!
        {
        didSet {
            userNameTextField.tintColor = UIColor.lightGray
            userNameTextField.setIcon(UIImage(named: "user")!)
        }
    }
    func validationSuccessful() {
            guard let fullName = userNameTextField.text,
                      let email = emailTextField.text,
                      let password = passwordTextField.text,
                      let phoneNumber = mobileTextField.text,
                      let confirmPassword = conPassTextField.text else { return }
                  
                  if agreeCheckBoc.on {
                  presenter.register(fullName: fullName, phone: phoneNumber, email: email, password: password, confirmPassword: confirmPassword)
                  }
                  else{
                      self.view.makeToast("please accept terms & conditions".localiz(), duration: 3.0, position: .bottom)
                  }
       }
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var presenter: RegistrationPresenter!
    var language : String?
    @IBAction func registerBtn(_ sender: UITextField) {
       validator.validate(self)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
        agreeCheckBoc.boxType = .square
        userNameTextField.placeholderColor(.darkGray)
        mobileTextField.placeholderColor(.darkGray)
        emailTextField.placeholderColor(.darkGray)
        conPassTextField.placeholderColor(.darkGray)
        passwordTextField.placeholderColor(.darkGray)
        validator.registerField(userNameTextField, errorLabel: fullNameErrorLabel , rules: [RequiredRule(), FullNameRule()])
        validator.registerField(emailTextField, errorLabel: emailErrorLabel, rules: [RequiredRule(), EmailRule()])
        validator.registerField(mobileTextField, errorLabel: phoneErrorLabel, rules: [RequiredRule(), MinLengthRule(length: 11)])
        validator.registerField(passwordTextField, errorLabel: passwordErrorLabel, rules: [RequiredRule(), PasswordRule()])
        validator.registerField(conPassTextField, errorLabel: confirmPasswordErrorLabel, rules: [RequiredRule(), ConfirmationRule(confirmField: passwordTextField)])
             
        presenter = RegistrationPresenter(view: self)
       // language = UserDefaults.standard.string(forKey: "language")
//        if language == "en"{
//            signinBtn.titleLabel?.textAlignment = .left
//        } else{
//            signinBtn.titleLabel?.textAlignment = .right
//
//        }

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
    
    @IBAction func loginBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    override func viewDidAppear(_ animated: Bool) {
        scroller.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+900)
    }
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    
    
}
