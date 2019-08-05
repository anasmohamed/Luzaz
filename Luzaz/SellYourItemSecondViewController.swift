//
//  SellYourItemSecondViewController.swift
//  Luzaz
//
//  Created by Admin on 8/1/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class SellYourItemSecondViewController: UIViewController {

    @IBOutlet weak var selectCategory: UITextField!
    
    @IBOutlet weak var categoryDropList: UIPickerView!
    var categoryList = ["Cars" , "Properties" , "Babies" , "Mobile Phones & Accessories" ,"Pets" , "Jobs"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView (pickerView:UIPickerView) ->Int {
        return 1
    }
    
    func pickerView (pickerView:UIPickerView ,umberOfComponentsInPickerView component:Int  )->Int{
        return categoryList.count
    }
    func pickerView (pickerView:UIPickerView ,titelOfRaw raw:Int , forComponent component :Int)-> String{
        self.view.endEditing(true)
        return categoryList[raw]
        
    }
    
    func pickerView (pickerView:UIPickerView ,didSelectedRaw raw :Int , InComponent component:Int){
        self.selectCategory.text = self.categoryList [raw]
        self.categoryDropList.isHidden = true
    }
    
    func textFieldDidBeginEditing(textField :UITextField)
    {
        if textField == self.selectCategory{
            self.categoryDropList.isHidden = false
            textField.endEditing(true)
            
        }


}
}
