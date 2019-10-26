//
//  UserCompetitionViewController.swift
//  Luzaz
//
//  Created by jets on 1/20/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit

class UserCompetitionViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var firstName : String?
    var lastName: String?
    var email : String?
    var phone :String?
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @objc func keyboardWillShow(notify: NSNotification) {
        
        if let keyboardSize = (notify.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            
            if self.view.frame.origin.y == 0 {
                
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notify: NSNotification) {
        
        if let keyboardSize = (notify.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            
            if self.view.frame.origin.y != 0 {
                
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        let questionVC = storyboard?.instantiateViewController(withIdentifier: "CompetitionVC") as! CompetitionViewController
        if  !(emailTextField.text?.isEmpty)! ||
            !(firstNameTextField.text?.isEmpty)! ||
            !(phoneTextField.text?.isEmpty)! ||
            !(lastNameTextField.text?.isEmpty)!
        {
            questionVC.userPhone = phoneTextField.text
            questionVC.userEmail = emailTextField.text
            questionVC.userFristName = firstNameTextField.text
            questionVC.userLastName = lastNameTextField.text
            
            self.present(questionVC, animated: true, completion: nil)
        }else
        {
            let alertController = UIAlertController(title: "Error", message: "you should enter all data ", preferredStyle: .alert)
                   
                   let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                   alertController.addAction(action)
                   
                   present(alertController, animated: true, completion: nil)
        }
        
       
    }
    
    
}
