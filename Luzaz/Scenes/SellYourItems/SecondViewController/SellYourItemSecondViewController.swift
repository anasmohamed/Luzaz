//
//  SellYourItemSecondViewController.swift
//  Luzaz
//
//  Created by Admin on 8/1/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class SellYourItemSecondViewController: UIViewController,SellYourItemView {

    @IBOutlet weak var selectCategory: UITextField!
    var presenter : SellYourItemPresenter!

    var isChooseFromCategoryList = false
    var isChooseFromSubCategoryList = false
    var isChooseFrombrandList = false

    @IBOutlet weak var brandStackView: UIStackView!
    @IBOutlet weak var subCategoryStackView: UIStackView!
    @IBOutlet weak var categoryDropList: UIPickerView!
    var categoryList = ["Cars" , "Properties" , "Babies" , "Mobile Phones & Accessories" ,"Pets" , "Jobs"]
    var subCategoryList = ["Cars" , "Properties" , "Babies" , "Mobile Phones & Accessories" ,"Pets" , "Jobs"]
    var brands = ["Cars" , "Properties" , "Babies" , "Mobile Phones & Accessories" ,"Pets" , "Jobs"]
    override func viewDidLoad() {
        super.viewDidLoad()
        subCategoryStackView.isHidden = true
        brandStackView.isHidden = true
        presenter = SellYourItemPresenter(view: self)


    }

    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if isChooseFromCategoryList && isChooseFromSubCategoryList && isChooseFrombrandList
        {
            let sellYourItemSecondVC = storyboard?.instantiateViewController(withIdentifier:"SellYourItemFourthVC")as! SellYourItemFourthViewController
            self.present(sellYourItemSecondVC,animated:true,completion: nil)
            
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
