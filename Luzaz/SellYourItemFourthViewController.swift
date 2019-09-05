//
//  SellYourItemFourthViewController.swift
//  Luzaz
//
//  Created by Admin on 8/1/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class SellYourItemFourthViewController: UIViewController,SellYourItemFourthView {
    
    @IBOutlet weak var itemDescritionTextField: UITextView!
    @IBOutlet weak var itemTitleTextView: UITextField!
    @IBOutlet weak var conditionList: UIPickerView!
    var conditionsList = ["New","Used"]
    var isConditionEnterd = false
    var presenter : SellYourItemFourthPresenter!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        
        if isConditionEnterd &&  !(itemTitleTextView.text?.isEmpty)!
        {
            presenter.setItemTitle(title: itemTitleTextView.text!)
            presenter.setItemDescription(descrition: itemDescritionTextField.text)
            let sellYourItemSecondVC = storyboard?.instantiateViewController(withIdentifier:"SellYourItemSecondVC")as! SellYourItemSecondViewController
            self.present(sellYourItemSecondVC,animated:true,completion: nil)
            
        }else
        {
            showError(error: "you must choose condition")
        }
    }
    
    
}
