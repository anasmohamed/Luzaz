//
//  SellYourItemSecondViewController.swift
//  Luzaz
//
//  Created by Admin on 8/1/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class SellYourItemSecondViewController: UIViewController,SellYourItemSecondView {

    @IBOutlet weak var selectCategory: UITextField!
    var presenter : SellYourItemSecondPresenter!

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
        presenter = SellYourItemSecondPresenter(view: self)


    }

   

    func textFieldDidBeginEditing(textField :UITextField)
    {
        if textField == self.selectCategory{
            self.categoryDropList.isHidden = false
            textField.endEditing(true)
            
        }


}
}
