//
//  SellYourItemThirdViewController.swift
//  Luzaz
//
//  Created by jets on 1/5/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit

class SellYourItemThirdViewController: UIViewController,SellYourItemView {
    @IBOutlet weak var finishedTextView: UITextField!
    @IBOutlet weak var levelsTextView: UITextField!
    @IBOutlet weak var areaTextView: UITextField!
    @IBOutlet weak var bathroomsNumberTextView: UITextField!
    @IBOutlet weak var bedroomsNumberTextView: UITextField!
    var presenter : SellYourItemPresenter!
    var offerImage : UIImage?
    var city : String?
    var category : String?
    var subCategory : String?
    var brand : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SellYourItemPresenter(view: self)
        self.hideKeyboardWhenTappedAround()

    }
    
    
    
    func showError(error: String) {
        
    }
    
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if !(finishedTextView.text?.isEmpty)! && !(levelsTextView.text?.isEmpty)! && !(areaTextView.text?.isEmpty)! && !(bathroomsNumberTextView.text?.isEmpty)! && !(bedroomsNumberTextView.text?.isEmpty)!
        {
            let sellYourItemSecondVC = storyboard?.instantiateViewController(withIdentifier:"SellYourItemFourthVC")as! SellYourItemFourthViewController
            self.present(sellYourItemSecondVC,animated:true,completion: nil)
            
        }else
        {
            showError(error: "You Must Fill the data")
        }
    }
    
}
