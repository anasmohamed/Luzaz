//
//  SellYourItemEndViewController.swift
//  Luzaz
//
//  Created by Admin on 8/1/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class SellYourItemEndViewController: UIViewController,SellYourItemView {
    
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
    var offerDescription: String?
    //var location : String?
    var price : String?
    var discount :String?
    var contactType : String?
    var phoneNumber: String?
    var bathrooms : String?
    var bedrooms: String?
    var area : String?
    var finished :String?
    var level : String?
    var attributes :String?
    var attributesValues:String?
    var long : String?
    var lat : String?
    var attributeValues : [String]?
    var attributeIds: [String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SellYourItemPresenter(view: self)
        self.hideKeyboardWhenTappedAround()
        guard let  phoneNumber =  UserDefaults.standard.string(forKey: "phone")
       
        else {
            return    }
        
        if (phoneNumber.isEmpty)
        {
            contactType = "1"
        }else
        {
            contactType = "3"
        }
        
        //        attributes = "bedrooms,bathrooms,area,level,finish"
        //        if !(bedrooms?.isEmpty)!{
        //            attributesValues = "\(bedrooms),\(bathrooms),\(area),\(level),\(finished)"}
        //        else{
        //            attributesValues = ""
        //        }
        if brand == nil{
            brand = ""
        }
        
    }
    
    @IBAction func finishBtnWasPressed(_ sender: Any) {
        if !(emailTextView.text?.isEmpty)! && !(fullNameTextView.text?.isEmpty)! && !(mobileNumberTextView.text?.isEmpty)! {
            presenter.addUserOffer(token:UserDefaults.standard.string(forKey: "token")!,privacy_policy:"1",id_governate:city!,id_category:category!,id_sub_category:subCategory!,attr:(attributeIds?.joined(separator: ","))!,attr_values:(attributeValues?.joined(separator: ","))!,title:offerTitle!,id_brand:brand!,offer_type:condition!,decription:"",price:price!,discount_prec:discount!,youtube_link:"",reseller_name:fullNameTextView.text!,reseller_phone:mobileNumberTextView.text!,reseller_mail:(emailTextView.text)!,contact_type:contactType!,image: offerImage!,album:[nil],lat: lat ?? "",long: long ?? "")
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
