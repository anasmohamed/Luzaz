//
//  UserCompetitionViewController.swift
//  Luzaz
//
//  Created by jets on 1/20/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit
import SDWebImage
class UserCompetitionViewController: UIViewController ,CompetitionView{
    
    
    @IBOutlet weak var logoImageView: UIImageView!
    func displayQuestion(question: String, arQuesetion: String) {
        
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func getCompetitionSuccess() {
        competitionImageView.sd_setImage(with: URL(string:"http://luzaz.com/upload/\(presenter.getImage())"))
    }
    
    func showError(error: String, content: String) {
        
    }
    
    func displayFirstOption(firstOption: String) {
        
    }
    
    func displaySecondOption(secondOption: String) {
        
    }
    
    func displayThreeOption(threeOption: String) {
        
    }
    
    func displayQuestion(question: String) {
        
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    private var presenter: CompetitionPresenter!

    @IBOutlet weak var competitionImageView: UIImageView!
    var firstName : String?
    var lastName: String?
    var email : String?
    var phone :String?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CompetitionPresenter(view: self)
        presenter.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
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
            questionVC.modalPresentationStyle = .fullScreen
            self.present(questionVC, animated: true, completion: nil)
        }else
        {
            let alertController = UIAlertController(title: "Error".localiz(), message: "you should enter all data ".localiz(), preferredStyle: .alert)
                   
                   let action = UIAlertAction(title: "OK".localiz(), style: .default, handler: nil)
                   alertController.addAction(action)
                   
                   present(alertController, animated: true, completion: nil)
        }
        
       
    }
    
    
}
