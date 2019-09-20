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
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        let questionVC = storyboard?.instantiateViewController(withIdentifier: "QuestionVC") as! QuestionsViewController
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
            
        }
        
       
    }
    
    
}
