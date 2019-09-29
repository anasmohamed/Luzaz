//
//  SellYourItemSecondViewCotroller+PickerDelegate.swift
//  Luzaz
//
//  Created by jets on 1/2/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import UIKit
extension SellYourItemSecondViewController : UIPickerViewDelegate,UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if pickerView.tag == 1
        {
            return presenter.getMainCategoriesCount()
        }else if pickerView.tag == 2
        {
            return subCategoryPresenter.getSubCategoriesCount()
            
        }else{
            return brands.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1
        {
            return presenter.getMainCategoryName(row: row)
        }else if pickerView.tag == 2
        {
            return subCategoryList[row]
            
        }else{
            return brands[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if pickerView.tag == 1
        {
            subCategoryStackView.isHidden = false
            category = presenter.getMainCategoryId(row: row)
            isChooseFromCategoryList = true
        }
        else if pickerView.tag == 2
        {
            brandStackView.isHidden = false
           
            subCategory = subCategoryList[row]
            isChooseFromSubCategoryList = true
        }
        else{
            presenter.setItemBrand(brand: brands[row])
            brand = brands[row]
            isChooseFrombrandList = true
            
        }
        
    }
}
