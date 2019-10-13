//
//  SellYourItemFifthViewController.swift
//  Luzaz
//
//  Created by Admin on 8/1/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class SellYourItemFifthViewController: UIViewController , SellYourItemView{
    @IBOutlet weak var priceTextView: UITextField!

    @IBOutlet weak var discountTextView: UITextField!
    var presenter : SellYourItemPresenter!
    var offerImage : UIImage?
    var city : String?
    var category : String?
    var subCategory : String?
    var brand : String?
    var condition : String?
    var offerTitle: String?
    var offerDescription: String?
    var location : String?
    var bathrooms : String?
    var bedrooms: String?
    var area : String?
    var finished :String?
    var level : String?
    var long : String?
    var lat : String?
    var isApartment : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SellYourItemPresenter(view: self)
        self.hideKeyboardWhenTappedAround()

    }
 
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if !(priceTextView.text?.isEmpty)! {
           
            let sellYourItemEndVC = storyboard?.instantiateViewController(withIdentifier:"SellYourItemEndVC")as! SellYourItemEndViewController
            sellYourItemEndVC.brand = brand
            sellYourItemEndVC.category = category
            sellYourItemEndVC.city = city
            sellYourItemEndVC.offerDescription = offerDescription
            sellYourItemEndVC.offerImage = offerImage
            sellYourItemEndVC.subCategory = subCategory
            sellYourItemEndVC.price = priceTextView.text!
            sellYourItemEndVC.discount = discountTextView.text!
            sellYourItemEndVC.offerTitle = offerTitle
            sellYourItemEndVC.long = long
            sellYourItemEndVC.lat = lat
//            sellYourItemEndVC.location = location
            sellYourItemEndVC.condition = condition
            sellYourItemEndVC.offerDescription = offerDescription
            if isApartment
            {
                sellYourItemEndVC.area = area
                sellYourItemEndVC.bedrooms = bedrooms
                sellYourItemEndVC.bathrooms = bathrooms
                sellYourItemEndVC.level = level
                sellYourItemEndVC.finished = finished            }
            self.present(sellYourItemEndVC,animated:true,completion: nil)
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
