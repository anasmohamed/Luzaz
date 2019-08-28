//
//  SellYourItemViewController.swift
//  Luzaz
//
//  Created by Salwa on 5/1/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class SellYourItemViewController: UIViewController ,UINavigationControllerDelegate,UIImagePickerControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var cityList: UITextField!
    @IBOutlet weak var dropDown: UIPickerView!
    var imagePicker = UIImagePickerController()

    var list = ["Cairo","Giza","Alex"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func selectPhotoBtnWasPressed(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
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
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        }
        
        picker.dismiss(animated: true, completion: nil);
        
    }
//    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
//        imageView.image = image
//        self.dismiss(animated: true, completion: { () -> Void in})
//
//    }
    
    
    func textFieldDidBeginEditing(textField :UITextField)
    {
        if textField == self.cityList{
            self.dropDown.isHidden = false
            textField.endEditing(true)
            
        }
    }
    
}
