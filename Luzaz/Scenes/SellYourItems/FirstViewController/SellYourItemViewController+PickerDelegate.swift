//
//  SellYourItemViewController+PickerDelegate.swift
//  Luzaz
//
//  Created by jets on 12/27/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import UIKit
extension SellYourItemViewController : UIPickerViewDelegate,UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if !token.isEmpty{
        return presenter.getGovernoratesCount()
        }else
        {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  presenter.getGovernoratesName(row: row,city: cityName ?? "")
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        cityIndex = presenter.getGovernoratesId(row: row)
        isCityEntered = true
    }
}
