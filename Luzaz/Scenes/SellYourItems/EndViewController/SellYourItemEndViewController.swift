//
//  SellYourItemEndViewController.swift
//  Luzaz
//
//  Created by Admin on 8/1/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class SellYourItemEndViewController: UIViewController,SellYourItemEndView {
    func offerAddedSuccessfully(message: String) {
        showError(error: message)
    }
    
    func showSpinner() {
        spinner.startAnimating()
    }
    
    func hideSpinner() {
      spinner.stopAnimating()
    }
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var mobileNumberTextView: UITextField!
    @IBOutlet weak var emailTextView: UITextField!
    @IBOutlet weak var fullNameTextView: UITextField!
    var presenter : SellYourItemPresenter!
    
    var offerImage : UIImage?
    var city : String?
    var category : String?
    var subCategory : String?
    var brand : String?
    var condition : String?
    var offerTitle: String?
    var offerDescription: String = ""
    var price : String?
    var discount :String?
    var contactType : String?
    var phoneNumber = ""
    var attributes :String?
    var attributesValues:String?
    var long : String?
    var lat : String?
    var attributeValues : [String]?
    var offerAlbum = [UIImage]()
    var attributeIds: [String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SellYourItemPresenter(view: self)
        self.hideKeyboardWhenTappedAround()
        if UserDefaults.standard.string(forKey: "phone") != nil
        {
            phoneNumber = UserDefaults.standard.string(forKey: "phone")!
            contactType = "2"
        }
        if (phoneNumber.isEmpty)
        {
            contactType = "1"
        }else
        {
            contactType = "3"
        }
        
     
        if brand == nil{
            brand = "0"
        }
        
    }
    
    @IBAction func finishBtnWasPressed(_ sender: Any) {
        if !(emailTextView.text?.isEmpty)! && !(fullNameTextView.text?.isEmpty)! && !(mobileNumberTextView.text?.isEmpty)! {
            presenter.addUserOffer(token:UserDefaults.standard.string(forKey: "token")!,privacy_policy:"1",id_governate:city!,id_category:category!,id_sub_category:subCategory!,attr:(attributeIds?.joined(separator: ","))!,attr_values:(attributeValues?.joined(separator: ","))!,title:offerTitle!,id_brand:brand!,offer_type:condition!,decription:offerDescription,price:price!,discount_prec:discount!,youtube_link:"",reseller_name:fullNameTextView.text!,reseller_phone:mobileNumberTextView.text!,reseller_mail:(emailTextView.text)!,contact_type:contactType!,image:offerImage!,album:offerAlbum,lat: lat ?? "",long: long ?? "",spinner: spinner)
                       
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
