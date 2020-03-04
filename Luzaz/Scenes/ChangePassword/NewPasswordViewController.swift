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
        {
        didSet {
            tekenTextField.tintColor = UIColor.lightGray
            tekenTextField.setIcon(UIImage(named: "userIcon")!)
        }}
    @IBOutlet weak var emailTextField: UITextField!
        {
        didSet {
            emailTextField.tintColor = UIColor.lightGray
            emailTextField.setIcon(UIImage(named: "userIcon")!)
        }}
    @IBOutlet weak var passwordTextField: UITextField!
        {
        didSet {
            passwordTextField.tintColor = UIColor.lightGray
            passwordTextField.setIcon(UIImage(named: "userIcon")!)
        }}
    @IBOutlet weak var confirmPasswordTextFiled: UITextField!
        {
        didSet {
            confirmPasswordTextFiled.tintColor = UIColor.lightGray
            confirmPasswordTextFiled.setIcon(UIImage(named: "userIcon")!)
        }}
    @IBOutlet weak var logoImageView: UIImageView!
    var email : String?
    var presenter: ResetPasswordPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ResetPasswordPresenter(view:self)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        logoImageView.isUserInteractionEnabled = true
        logoImageView.addGestureRecognizer(tapGestureRecognizer)
        emailTextField.text = email
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let homeViewController = ContainerVC()
        homeViewController.modalPresentationStyle = .fullScreen
        present(homeViewController, animated: true, completion: nil)
    }
    @IBAction func resetPasswordBtnWasPressed(_ sender: Any) {
        
        if !passwordTextField.text!.isEmpty && !confirmPasswordTextFiled.text!.isEmpty
            && !emailTextField.text!.isEmpty && !tekenTextField.text!.isEmpty{
          if  isValidEmailAddress(emailAddressString: emailTextField.text!),
             isValidPassword(password: passwordTextField.text!),
             isValidConfrimPassword(password: passwordTextField.text!, confirmPassword: confirmPasswordTextFiled.text!) {
            
            presenter.setPasswordByToken(token: tekenTextField.text!, password: passwordTextField.text!, rePassword: confirmPasswordTextFiled.text!)}
          else{
            showError(error:"please enter valid data")

            }
            
        }else{
            showError(error:"please fill all texts")

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
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        present(loginVC, animated: true, completion: nil)
    }
    private func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0 {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("Invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return returnValue
    }
    private func isValidPhoneNumber(phoneNumberString: String) -> Bool {
        
        var returnValue = true
        let phoneRegex = "^((\\+)|(00))[0-9]{6,14}$"
        
        do {
            let regex = try NSRegularExpression(pattern: phoneRegex)
            let nsString = phoneNumberString as NSString
            let results = regex.matches(in: phoneNumberString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0 {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("Invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return returnValue
    }

    private func isValidPassword(password: String) -> Bool {
        return !(password.isEmpty)
    }
    private func saveUserIntoUserDefaults(user: User) {
           let userDefaults = UserDefaults.standard
           
           userDefaults.set(user.userId, forKey: "userId")
           userDefaults.set(user.token, forKey: "token")
           userDefaults.set(user.fullName, forKey:"fullName")
           userDefaults.set(user.email, forKey: "email")
           userDefaults.set(user.phoneNumber, forKey: "phone")
           
       }
    private func isValidConfrimPassword(password: String, confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error".localiz(), message: error.localiz(), preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK".localiz(), style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
