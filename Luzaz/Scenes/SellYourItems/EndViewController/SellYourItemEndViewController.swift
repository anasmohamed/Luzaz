//
//  SellYourItemEndViewController.swift
//  Luzaz
//
//  Created by Admin on 8/1/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class SellYourItemEndViewController: UIViewController,SellYourItemView {

   
    @IBOutlet weak var mobileNumberTextView: UITextField!
    @IBOutlet weak var emailTextView: UITextField!
    @IBOutlet weak var fullNameTextView: UITextField!
    var presenter : SellYourItemPresenter!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SellYourItemPresenter(view: self)

    }
    
    @IBAction func finishBtnWasPressed(_ sender: Any) {
        if !(emailTextView.text?.isEmpty)! && !(fullNameTextView.text?.isEmpty)! && !(mobileNumberTextView.text?.isEmpty)! {
            presenter.setEmail(email: emailTextView.text!)
            presenter.setFullName(fullName: fullNameTextView.text!)
            presenter.setMobileNumber(mobileNumber: mobileNumberTextView.text!)
            presenter.addUserOffer()
//            let sellYourItemSecondVC = storyboard?.instantiateViewController(withIdentifier:"SellYourItemSecondVC")as! SellYourItemSecondViewController
//            self.present(sellYourItemSecondVC,animated:true,completion: nil)
        }else{
            showError(error: "You Should Enter Price")
        }
        
    }
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
