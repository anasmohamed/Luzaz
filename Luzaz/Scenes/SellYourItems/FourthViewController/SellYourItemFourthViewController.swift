//
//  SellYourItemFourthViewController.swift
//  Luzaz
//
//  Created by Admin on 8/1/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SellYourItemFourthViewController: UIViewController,SellYourItemView ,CLLocationManagerDelegate{
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var itemDescritionTextField: UITextView!
    @IBOutlet weak var itemTitleTextView: UITextField!
    @IBOutlet weak var conditionList: UIPickerView!
    
    
    @IBOutlet weak var firstArrowImage: UIImageView!{
        didSet {
            firstArrowImage.image = firstArrowImage.image?.flipIfNeeded()
        }
    }
    
    @IBOutlet weak var secondArrowImage: UIImageView!{
        didSet {
            secondArrowImage.image = secondArrowImage.image?.flipIfNeeded()
        }
    }
    
    @IBOutlet weak var thirdArrowImage: UIImageView!{
        didSet {
            thirdArrowImage.image = thirdArrowImage.image?.flipIfNeeded()
        }
    }
    var conditionsList = ["New".localiz(),"Used".localiz()]
    var isConditionEnterd = false
    var presenter : SellYourItemPresenter!
    var offerImage : UIImage?
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
    
    var city : String?
    var category : String?
    var subCategory : String?
    var brand : String?
    var offerCondition :String?
    var offerTitle: String?
    var offerLocation : String?
    var offerDescription: String = ""
    var long : String = ""
    var lat : String = ""
    var attributeValues : [String]?
    var attributeIds: [String]?
    var incomeOfferId:String?

    var offerAlbum = [UIImage]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        presenter = SellYourItemPresenter(view: self)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
                  logoImageView.isUserInteractionEnabled = true
                  logoImageView.addGestureRecognizer(tapGestureRecognizer)
        self.hideKeyboardWhenTappedAround()
        locationManager.requestWhenInUseAuthorization()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        if isEditProduct
        {
            itemDescritionTextField.text = incomeDiscription
            itemTitleTextView.text = incomeTitle
            
            
        }
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap))
        mapView.addGestureRecognizer(longTapGesture)
    }
    @objc func longTap(sender: UIGestureRecognizer){
        if sender.state == .began {
            let locationInView = sender.location(in: mapView)
            let locationOnMap = mapView.convert(locationInView, toCoordinateFrom: mapView)
            addAnnotation(location: locationOnMap)
            print(locationOnMap.latitude)
            lat = String(locationOnMap.latitude)
            long = String(locationOnMap.longitude)
            
        }
    }
    @objc func keyboardWillShow(notify: NSNotification) {
           
           if let keyboardSize = (notify.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
               
               if self.view.frame.origin.y == 0 {
                   
                   self.view.frame.origin.y -= keyboardSize.height
               }
           }
       }
       
       @objc func keyboardWillHide(notify: NSNotification) {
           
           if let keyboardSize = (notify.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
               
               if self.view.frame.origin.y != 0 {
                   
                   self.view.frame.origin.y += keyboardSize.height
               }
           }
       }
    func addAnnotation(location: CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Some Title"
        annotation.subtitle = "Some Subtitle"
        self.mapView.addAnnotation(annotation)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        long = String(locValue.longitude)
        lat = String(locValue.latitude)
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
          let homeViewController = ContainerVC()
           homeViewController.modalPresentationStyle = .fullScreen
                 present(homeViewController, animated: true, completion: nil)
       }
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        
        if isConditionEnterd &&  !(itemTitleTextView.text?.isEmpty)! && !(itemDescritionTextField.text.isEmpty)
        {
            
            let sellYourItemFifthVC = storyboard?.instantiateViewController(withIdentifier:"SellYourItemFifthVC")as! SellYourItemFifthViewController
            sellYourItemFifthVC.brand = brand
            sellYourItemFifthVC.category = category
            sellYourItemFifthVC.city = city
            sellYourItemFifthVC.offerDescription = itemDescritionTextField.text
            sellYourItemFifthVC.offerImage = offerImage
            sellYourItemFifthVC.subCategory = subCategory
            sellYourItemFifthVC.condition  = offerCondition
            sellYourItemFifthVC.lat = lat
            sellYourItemFifthVC.long = long
            sellYourItemFifthVC.offerTitle = itemTitleTextView.text!
            sellYourItemFifthVC.offerDescription = itemDescritionTextField.text!
            sellYourItemFifthVC.offerAlbum = offerAlbum
            sellYourItemFifthVC.isEditProduct = isEditProduct
            if isEditProduct
            {
                sellYourItemFifthVC.incomePrice = incomePrice
                sellYourItemFifthVC.incomeDiscount = incomeDiscount
                sellYourItemFifthVC.incomeSellerMail = incomeSellerMail
                sellYourItemFifthVC.incomeSellerName = incomeSellerName
                sellYourItemFifthVC.incomeSellerPhone = incomeSellerPhone
                sellYourItemFifthVC.isEditProduct = isEditProduct
            }
            if !(attributeIds?.isEmpty)!
            {
                sellYourItemFifthVC.attributeValues = attributeValues
                sellYourItemFifthVC.attributeIds = attributeIds
               
            }
            sellYourItemFifthVC.modalPresentationStyle = .fullScreen
            self.present(sellYourItemFifthVC,animated:true,completion: nil)
            
        }else
        {
            showError(error: "you must choose condition")
        }
    }
    
    
}
