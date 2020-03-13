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
    
    @IBOutlet weak var firstArrowImage: UIImageView!{
        didSet {
            firstArrowImage.image = firstArrowImage.image?.flipIfNeeded()
        }
    }
    
    @IBOutlet weak var secondArrowImage: UIImageView!{
        didSet {
            secondArrowImage.image = secondArrowImage.image?.flipIfNeeded()
        }
    }
    
    @IBOutlet weak var thirdArrowImage: UIImageView!{
        didSet {
            thirdArrowImage.image = thirdArrowImage.image?.flipIfNeeded()
        }
    }
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var bedroomsNumberTextView: UITextField!
    var presenter : SellYourItemPresenter!
    var offerImage : UIImage?
    var city : String?
    var category : String?
    var subCategory : String?
    var bathrooms : String?
    var bedrooms: String?
    var area : String?
    var isEditProduct : Bool = false
    var finished :String?
    var level : String?
    var incomeOfferId:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SellYourItemPresenter(view: self)
        self.hideKeyboardWhenTappedAround()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
                  logoImageView.isUserInteractionEnabled = true
                  logoImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {let homeViewController = ContainerVC()
           homeViewController.modalPresentationStyle = .fullScreen
                 present(homeViewController, animated: true, completion: nil)
       }
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error".localiz(), message: error.localiz(), preferredStyle: .alert)
             let action = UIAlertAction(title: "OK".localiz(), style: .default, handler: nil)
             alertController.addAction(action)
             present(alertController, animated: true, completion: nil)
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
            sellYourItemFourthVC.modalPresentationStyle = .fullScreen
            sellYourItemFourthVC.isEditProduct = isEditProduct
            self.present(sellYourItemFourthVC,animated:true,completion: nil)
            
        }else
        {
            showError(error: "You Must Fill the data")
        }
    }
    
}
