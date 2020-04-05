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
class RegisterViewController: UIViewController {
    @IBOutlet weak var agreeCheckBoc: BEMCheckBox!
    
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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var presenter: RegistrationPresenter!
    var language : String?
    @IBAction func registerBtn(_ sender: UITextField) {
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
    override func viewDidLoad() {
        super.viewDidLoad()
        agreeCheckBoc.boxType = .square
        userNameTextField.placeholderColor(.darkGray)
        mobileTextField.placeholderColor(.darkGray)
        emailTextField.placeholderColor(.darkGray)
        conPassTextField.placeholderColor(.darkGray)
        passwordTextField.placeholderColor(.darkGray)

        presenter = RegistrationPresenter(view: self)
       // language = UserDefaults.standard.string(forKey: "language")
//        if language == "en"{
//            signinBtn.titleLabel?.textAlignment = .left
//        } else{
//            signinBtn.titleLabel?.textAlignment = .right
//
//        }

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
