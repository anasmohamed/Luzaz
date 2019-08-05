//
//  SellYourItemViewController.swift
//  Luzaz
//
//  Created by Salwa on 5/1/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class SellYourItemViewController: UIViewController {


    @IBOutlet weak var cityList: UITextField!
    @IBOutlet weak var dropDown: UIPickerView!
    
    var list = ["Cairo","Giza","Alex"]
    
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
        return list.count
    }
    func pickerView (pickerView:UIPickerView ,titelOfRaw raw:Int , forComponent component :Int)-> String{
        self.view.endEditing(true)
        return list[raw]
    }
    
    func pickerView (pickerView:UIPickerView ,didSelectedRaw raw :Int , InComponent component:Int){
         self.cityList.text = self.list[raw]
        self.dropDown.isHidden = true
    }
    
    func textFieldDidBeginEditing(textField :UITextField)
    {
        if textField == self.cityList{
            self.dropDown.isHidden = false
            textField.endEditing(true)
            
        }
    }
    
}
