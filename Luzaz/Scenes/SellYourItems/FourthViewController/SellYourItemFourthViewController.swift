//
//  SellYourItemFourthViewController.swift
//  Luzaz
//
//  Created by Admin on 8/1/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class SellYourItemFourthViewController: UIViewController,SellYourItemView {
    
    @IBOutlet weak var itemDescritionTextField: UITextView!
    @IBOutlet weak var itemTitleTextView: UITextField!
    @IBOutlet weak var conditionList: UIPickerView!
    var conditionsList = ["New","Used"]
    var isConditionEnterd = false
    var presenter : SellYourItemPresenter!
    var offerImage : UIImage?
    var city : String?
    var category : String?
    var subCategory : String?
    var brand : String?
    var offerCondition :String?
    var offerTitle: String?
    var offerLocation : String?
    var offreDescription: String?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        presenter = SellYourItemPresenter(view: self)
       self.hideKeyboardWhenTappedAround()
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
            let sellYourItemFifthVC = storyboard?.instantiateViewController(withIdentifier:"SellYourItemFifthVC")as! SellYourItemFifthViewController
            sellYourItemFifthVC.brand = brand
            sellYourItemFifthVC.category = category
            sellYourItemFifthVC.city = city
            sellYourItemFifthVC.location = offerLocation
            sellYourItemFifthVC.offerDescription = itemDescritionTextField.text
            sellYourItemFifthVC.offerImage = offerImage
            sellYourItemFifthVC.subCategory = subCategory
            sellYourItemFifthVC.condition  = offerCondition
            
            sellYourItemFifthVC.offerTitle = itemTitleTextView.text!
            
            self.present(sellYourItemFifthVC,animated:true,completion: nil)
            
        }else
        {
            showError(error: "you must choose condition")
        }
    }
    
    
}
