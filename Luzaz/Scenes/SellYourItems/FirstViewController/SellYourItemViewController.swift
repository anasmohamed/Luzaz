//
//  SellYourItemViewController.swift
//  Luzaz
//
//  Created by Salwa on 5/1/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class SellYourItemViewController: UIViewController ,UINavigationControllerDelegate,UIImagePickerControllerDelegate,SellYourItemFirstView{
    
    @IBOutlet weak var cityPickerView: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    var imagePicker = UIImagePickerController()
    var presenter : SellYourItemPresenter!
    var isCityEntered = false
    var cityIndex : String?
    var offerImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityPickerView.dataSource = self
        cityPickerView.delegate = self
        presenter = SellYourItemPresenter(view: self)
        
        self.hideKeyboardWhenTappedAround()
        

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidLoad()
    }
    
    @IBAction func nextButtonWasPressed(_ sender: Any) {
        if isCityEntered
        {
            let sellYourItemSecondVC = storyboard?.instantiateViewController(withIdentifier:"SellYourItemSecondVC")as! SellYourItemSecondViewController
            sellYourItemSecondVC.city = cityIndex
            sellYourItemSecondVC.offerImage = offerImage
            self.present(sellYourItemSecondVC,animated:true,completion: nil)
            
        }else
        {
           showError(error: "you must choose city")
        }
        
    }
    func getGovernoratesSuccess() {
        cityPickerView.reloadAllComponents()
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
    func showError(error : String)
    {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
   
    //
    //    func numberOfComponentsInPickerView (pickerView:UIPickerView) ->Int {
    //        return 1
    //    }
    //
    //    func pickerView (pickerView:UIPickerView ,umberOfComponentsInPickerView component:Int  )->Int{
    //        return list.count
    //    }
    //    func pickerView (pickerView:UIPickerView ,titelOfRaw raw:Int , forComponent component :Int)-> String{
    //        self.view.endEditing(true)
    //        return list[raw]
    //    }
    //
    //    func pickerView (pickerView:UIPickerView ,didSelectedRaw raw :Int , InComponent component:Int){
    //         self.cityList.text = self.list[raw]
    //        self.dropDown.isHidden = true
    //    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
            offerImage = image
            presenter.setOfferImage(image: image)
        }
        
        picker.dismiss(animated: true, completion: nil);
        
    }
    
    
    
}
