//
//  SellYourItemSecondViewController.swift
//  Luzaz
//
//  Created by Admin on 8/1/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class SellYourItemSecondViewController: UIViewController,MainCategoriesView,SubCategoriesView,SellYourItemSecondView {
    
    @IBOutlet weak var selectCategory: UITextField!
    var presenter : MainCategoriesPresenter!
    var subCategoryPresenter: SubCategoriesPresenter!
    var brandsPresenter : SellYourItemPresenter!
    
    var isChooseFromCategoryList = false
    var isChooseFromSubCategoryList = false
    var isChooseFrombrandList = false
    
    @IBOutlet weak var brandStackView: UIStackView!
    @IBOutlet weak var subCategoryStackView: UIStackView!
    @IBOutlet weak var categoryDropList: UIPickerView!
    var offerImage : UIImage?
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var brandPickerView: UIPickerView!
    @IBOutlet weak var subCategoryPickerView: UIPickerView!
    var city : String?
    var category : String?
    var subCategory : String?
    var isEditProduct : Bool = false
    
    var cityName : String?
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
    var incomeOfferId:String?

    var brand : String?
    var attributeList : [CategoryAttributes]?
    var offerAlbum = [UIImage]()
    @IBOutlet weak var nextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        subCategoryStackView.isHidden = true
        brandStackView.isHidden = true
        presenter = MainCategoriesPresenter(view: self)
        subCategoryPresenter = SubCategoriesPresenter(view :self)
        brandsPresenter = SellYourItemPresenter(view :self)
        presenter.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
    }
    func getMainCategoriesSuccess() {
        categoryDropList.reloadAllComponents()
        
    }
    func getSubCategoriesSuccess() {
        subCategoryPickerView.reloadAllComponents()
    }
    func getBrandsSuccess() {
        brandStackView.isHidden = false
        isChooseFrombrandList = true
        brandPickerView.reloadAllComponents()
        
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
          dismiss(animated: true, completion: nil)
    }
    func getBrandsEmpty()
    {
        isChooseFrombrandList = true
        brandStackView.isHidden = true
    }
    func showIndicator() {
        spinner.startAnimating()
    }
    func hideIndicator() {
        spinner.stopAnimating()
    }
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if isChooseFromCategoryList && isChooseFromSubCategoryList && isChooseFrombrandList && (attributeList?.isEmpty)!
        {
            let sellYourItemFourthVC = storyboard?.instantiateViewController(withIdentifier:"SellYourItemFourthVC")as! SellYourItemFourthViewController
            sellYourItemFourthVC.city = city
            sellYourItemFourthVC.offerImage = offerImage
            sellYourItemFourthVC.category = category
            sellYourItemFourthVC.subCategory = subCategory
            sellYourItemFourthVC.brand = brand
            sellYourItemFourthVC.offerAlbum = offerAlbum
            if isEditProduct{
                sellYourItemFourthVC.incomePrice = incomePrice
                sellYourItemFourthVC.incomeTitle = incomeTitle
                sellYourItemFourthVC.incomeCodition = incomeCodition
                sellYourItemFourthVC.incomeDiscount = incomeDiscount
                sellYourItemFourthVC.incomeSellerMail = incomeSellerMail
                sellYourItemFourthVC.incomeSellerName = incomeSellerName
                sellYourItemFourthVC.incomeSellerPhone = incomeSellerPhone
                sellYourItemFourthVC.incomeDiscription = incomeDiscription
                sellYourItemFourthVC.incomeYoutubelink = incomeYoutubelink
                sellYourItemFourthVC.isEditProduct = isEditProduct
            }
            sellYourItemFourthVC.modalPresentationStyle = .fullScreen
            
            self.present(sellYourItemFourthVC,animated:true,completion: nil)
        }else if  isChooseFromCategoryList && isChooseFromSubCategoryList && isChooseFrombrandList && !(attributeList?.isEmpty)!
        {
            let sellYourItemThirdVC = storyboard?.instantiateViewController(withIdentifier:"PropertiesDetailsVC") as! PropertiesDetailsViewController
            sellYourItemThirdVC.city = city
            sellYourItemThirdVC.offerImage = offerImage
            sellYourItemThirdVC.category = category
            sellYourItemThirdVC.isEditProduct = isEditProduct
            sellYourItemThirdVC.subCategory = subCategory
            sellYourItemThirdVC.attributeList = attributeList
            sellYourItemThirdVC.offerAlbum = offerAlbum
            if isEditProduct{
                sellYourItemThirdVC.incomePrice = incomePrice
                sellYourItemThirdVC.incomeTitle = incomeTitle
                sellYourItemThirdVC.incomeCodition = incomeCodition
                sellYourItemThirdVC.incomeDiscount = incomeDiscount
                sellYourItemThirdVC.incomeSellerMail = incomeSellerMail
                sellYourItemThirdVC.incomeSellerName = incomeSellerName
                sellYourItemThirdVC.incomeSellerPhone = incomeSellerPhone
                sellYourItemThirdVC.incomeDiscription = incomeDiscription
                sellYourItemThirdVC.incomeYoutubelink = incomeYoutubelink
                sellYourItemThirdVC.isEditProduct = isEditProduct
            }
            sellYourItemThirdVC.modalPresentationStyle = .fullScreen
            
            self.present(sellYourItemThirdVC,animated:true,completion: nil)
            
        }else
        {
            showError(error: "You Must Choose Category and SubCategory and Brand")
        }
    }
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func textFieldDidBeginEditing(textField :UITextField)
    {
        if textField == self.selectCategory{
            self.categoryDropList.isHidden = false
            textField.endEditing(true)
            
        }
        
    }
}
