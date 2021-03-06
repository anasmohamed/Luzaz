//
//  SellYourItemEndViewController.swift
//  Luzaz
//
//  Created by Admin on 8/1/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class SellYourItemEndViewController: UIViewController,SellYourItemEndView {
    func updateOfferSuccessfully(message: String) {
        showAlert(content:message, title: "Success")
        
    }
    
    func offerAddedSuccessfully(message: String) {
        showAlert(content:message, title: "Success")
        
        
    }
    
    
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
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var mobileNumberTextView: UITextField!
    @IBOutlet weak var emailTextView: UITextField!
    @IBOutlet weak var fullNameTextView: UITextField!
    var presenter : SellYourItemPresenter!
    var isEditProduct : Bool = false
    
    @IBOutlet weak var logoImageView: UIImageView!
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
    var incomeOfferId:String?

    
    var incomeSellerName:String?
    var incomeSellerPhone:String?
    var incomeSellerMail:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SellYourItemPresenter(view: self)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
                  logoImageView.isUserInteractionEnabled = true
                  logoImageView.addGestureRecognizer(tapGestureRecognizer)
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
    func showSpinner() {
        spinner.startAnimating()
    }
    
    func hideSpinner() {
        spinner.stopAnimating()
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
          dismiss(animated: true, completion: nil)
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
          let homeViewController = ContainerVC()
           homeViewController.modalPresentationStyle = .fullScreen
                 present(homeViewController, animated: true, completion: nil)
       }
    @IBAction func finishBtnWasPressed(_ sender: Any) {
        if !(emailTextView.text?.isEmpty)! && !(fullNameTextView.text?.isEmpty)! && !(mobileNumberTextView.text!.isEmpty && isEditProduct) {
            presenter.addUserOffer(token:UserDefaults.standard.string(forKey: "token")!,privacy_policy:"1",id_governate:city!,id_category:category!,id_sub_category:subCategory!,attr:(attributeIds?.joined(separator: ","))!,attr_values:(attributeValues?.joined(separator: ","))!,title:offerTitle!,id_brand:brand!,offer_type:condition!,decription:offerDescription,price:price!,discount_prec:discount!,youtube_link:"",reseller_name:fullNameTextView.text!,reseller_phone:mobileNumberTextView.text!,reseller_mail:(emailTextView.text)!,contact_type:contactType!,image:offerImage!,album:offerAlbum,lat: lat ?? "",long: long ?? "")
            
        }else if(!(emailTextView.text?.isEmpty)! && !(fullNameTextView.text?.isEmpty)! && !(mobileNumberTextView.text!.isEmpty && isEditProduct))
        {
            presenter.updateOfferAlbumImages(token: UserDefaults.standard.string(forKey: "token")!, offer: incomeOfferId!, album: offerAlbum)
            presenter.updateUserOffer(token:UserDefaults.standard.string(forKey: "token")!,privacy_policy:"1",id_governate:city!,id_category:category!,id_sub_category:subCategory!,attr:(attributeIds?.joined(separator: ","))!,attr_values:(attributeValues?.joined(separator: ","))!,title:offerTitle!,id_brand:brand!,offer_type:condition!,decription:offerDescription,price:price!,discount_prec:discount!,youtube_link:"",reseller_name:fullNameTextView.text!,reseller_phone:mobileNumberTextView.text!,reseller_mail:(emailTextView.text)!,contact_type:contactType!,lat: lat ?? "",long: long ?? "")
            
        }
        else{
            showError(error: "You Should Enter Name ,email and mobile")
        }
        
    }
    
    func showError(error: String) {
        showAlert(content: error, title: "Error")
    }
    
    func showAlert(content:String,title:String)
    {
        //        let alertController = UIAlertController(title: title, message: content, preferredStyle: .alert)
        //        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        //               alertController.addAction(action)
        //
        //        present(alertController, animated: true, completion: {
        //            let offersVC = ContainerVC()
        //                         self.present(offersVC,animated:true,completion:nil)
        //
        //        })
        let alert = UIAlertController(title: title.localiz(), message: content.localiz(), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK".localiz(), style: .default, handler: { action in
            switch action.style{
            case .default:
                
                let offersVC = ContainerVC()
                offersVC.modalPresentationStyle = .fullScreen
                self.present(offersVC,animated:true,completion:nil)
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
            }}))
        self.present(alert, animated: true, completion: nil)
    }
}
