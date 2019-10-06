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
    var bathrooms : String?
    var bedrooms: String?
    var area : String?
    var finished :String?
    var level : String?
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
            bedrooms = bedroomsNumberTextView.text
            bathrooms = bathroomsNumberTextView.text
            area = areaTextView.text
            level = levelsTextView.text
            finished = finishedTextView.text
            let sellYourItemFourthVC = storyboard?.instantiateViewController(withIdentifier:"SellYourItemFourthVC")as! SellYourItemFourthViewController
            sellYourItemFourthVC.city = city
            sellYourItemFourthVC.offerImage = offerImage
            sellYourItemFourthVC.category = category
            sellYourItemFourthVC.subCategory = subCategory
            sellYourItemFourthVC.area = area
            sellYourItemFourthVC.bedrooms = bedrooms
            sellYourItemFourthVC.bathrooms = bathrooms
            sellYourItemFourthVC.finished = finished
            sellYourItemFourthVC.level = level

            self.present(sellYourItemFourthVC,animated:true,completion: nil)
            
        }else
        {
            showError(error: "You Must Fill the data")
        }
    }
    
}
