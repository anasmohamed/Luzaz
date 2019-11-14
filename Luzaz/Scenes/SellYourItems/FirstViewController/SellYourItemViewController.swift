//
//  SellYourItemViewController.swift
//  Luzaz
//
//  Created by Salwa on 5/1/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit
import OpalImagePicker
import SDWebImage
class SellYourItemViewController: UIViewController ,UINavigationControllerDelegate,SellYourItemFirstView,OpalImagePickerControllerDelegate{
    internal func showIndicator() {
        spinner.startAnimating()
    }
    func hideIndicator() {
        spinner.stopAnimating()
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var cityPickerView: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    var imagePicker = OpalImagePickerController()
    var presenter : SellYourItemPresenter!
    var isCityEntered = false
    var cityIndex : String?
    var isEditProduct : Bool = false
    var offerImage: UIImage?
    var offerAlbum = [UIImage]()
    var isPhotoChoosen = false
    var cityName : String?
    var incomeImage : String?
    var incomeBrand :String?
    var incomeCategory:String?
    var incomeSubCategory :String?
    var incomeCodition:String?
    var incomeDiscription :String?
    var incomeYoutubelink:String?
    var incomeTitle:String?
    var incomePrice :String?
    var incomeDiscount:String?
    var incomeSellerName:String?
    var incomeSellerPhone:String?
    var incomeSellerMail:String?
    let lblNew = UILabel()
    @IBOutlet weak var nextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        cityPickerView.dataSource = self
        cityPickerView.delegate = self
        presenter = SellYourItemPresenter(view: self)
        imagePicker.maximumSelectionsAllowed = 5
        imagePicker.imagePickerDelegate = self
        self.hideKeyboardWhenTappedAround()
        if isEditProduct
        {
            imageView.sd_setImage(with: URL(string: "http://luzaz.com/upload/\(incomeImage ?? "")"))
            textToImage(drawText: "change photo", atPoint:CGPoint( x: 0,y: imageView.frame.origin.y + 60))
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidLoad()
    }
    
    @IBAction func nextButtonWasPressed(_ sender: Any) {
        if isCityEntered && isPhotoChoosen
        {
            let sellYourItemSecondVC = storyboard?.instantiateViewController(withIdentifier:"SellYourItemSecondVC")as! SellYourItemSecondViewController
            sellYourItemSecondVC.city = cityIndex
            sellYourItemSecondVC.offerImage = offerImage
            sellYourItemSecondVC.isEditProduct = isEditProduct
            sellYourItemSecondVC.offerAlbum = offerAlbum
            if isEditProduct{
                sellYourItemSecondVC.incomeBrand = incomeBrand
                sellYourItemSecondVC.incomePrice = incomePrice
                sellYourItemSecondVC.incomeTitle = incomeTitle
                sellYourItemSecondVC.incomeCategory = incomeCategory
                sellYourItemSecondVC.incomeCodition = incomeCodition
                sellYourItemSecondVC.incomeDiscount = incomeDiscount
                sellYourItemSecondVC.incomeSellerMail = incomeSellerMail
                sellYourItemSecondVC.incomeSellerName = incomeSellerName
                sellYourItemSecondVC.incomeSellerPhone = incomeSellerPhone
                sellYourItemSecondVC.incomeDiscription = incomeDiscription
                sellYourItemSecondVC.incomeYoutubelink = incomeYoutubelink
                sellYourItemSecondVC.incomeSubCategory = incomeSubCategory
                sellYourItemSecondVC.isEditProduct = isEditProduct
                
            }
            sellYourItemSecondVC.modalPresentationStyle = .fullScreen
            self.present(sellYourItemSecondVC,animated:true,completion: nil)
            
        }else
        {
            showError(error: "you must choose city and photo")
        }
        
    }
    func getGovernoratesSuccess() {
        cityPickerView.reloadAllComponents()
    }
    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingImages images: [UIImage])
    {
        offerImage = images[0]
        imageView.image = images[0]
        offerAlbum = Array(images[1..<images.count])
        isPhotoChoosen = true
        imagePicker.dismiss(animated: true, completion: nil)
        
        
    }
    func imagePickerDidCancel(_ picker: OpalImagePickerController)
    {
        isPhotoChoosen = false
        
    }
    @IBAction func selectPhotoBtnWasPressed(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
        
    }
    func showError(error : String)
    {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    

    // Add text to image
    func textToImage(drawText text: NSString, atPoint point: CGPoint) {

        lblNew.frame = CGRect(x: point.x, y: point.y, width: 203.0, height: 30)
        lblNew.textAlignment = .center
        lblNew.text = text as String
        lblNew.textColor = UIColor.white
        lblNew.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5)
        imageView.addSubview(lblNew)
    }
    
    
}
