//
//  ForgetPasswordViewController.swift
//  Luzaz
//
//  Created by Anas Mohamed on 12/10/19.
//  Copyright © 2019 Luzaz. All rights reserved.
//

import UIKit
import Toast_Swift
class ForgetPasswordViewController: UIViewController, ChangePasswordView{
    
    @IBOutlet weak var logoImageView: UIImageView!
    func showIndicator() {
          spinner.startAnimating()
      }
      
      func hideIndicator() {
          spinner.stopAnimating()
      }
      
      func changePasswordSuccess(message:String) {

          let newPasswordVC = self.storyboard?.instantiateViewController(withIdentifier: "NewPasswordViewController") as! NewPasswordViewController
        newPasswordVC.email = emailTextField.text
        newPasswordVC.modalPresentationStyle = .fullScreen
          present(newPasswordVC, animated: true, completion: nil)
      }
      
      func showToast(controller: UIViewController, message : String, seconds: Double) {
          let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
          alert.view.backgroundColor = UIColor.black
          alert.view.alpha = 0.6
          alert.view.layer.cornerRadius = 15

          controller.present(alert, animated: true)

          DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
              alert.dismiss(animated: true)
          }
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
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
                  logoImageView.isUserInteractionEnabled = true
                  logoImageView.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
           let homeViewController = ContainerVC()
           homeViewController.modalPresentationStyle = .fullScreen
                 present(homeViewController, animated: true, completion: nil)
       }
    @IBAction func forgetPasswordBtnWasPressed(_ sender: Any) {
        if !emailTextField.text!.isEmpty
            
        {
            if  isValidEmailAddress(emailAddressString: emailTextField.text!){
                peresnter?.forgetPassword(email:emailTextField.text!)}
            else{
                showError(error: "you should enter valid email")

            }
        }else
        {
            showError(error: "you should enter your email")
        }
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
