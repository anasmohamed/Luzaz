//
//  PropertiesDetailsViewController.swift
//  Luzaz
//
//  Created by Anas Mohamed on 10/13/19.
//  Copyright © 2019 Luzaz. All rights reserved.
//

import UIKit

class PropertiesDetailsViewController: UIViewController,SellYourItemView ,UITextFieldDelegate{
  
    
    @IBOutlet weak var villaTextView: UITextField!
    @IBOutlet weak var numberOfRoomsTextView: UITextField!
    var presenter : SellYourItemPresenter!
    @IBOutlet weak var mainView: UIView!
    var offerImage : UIImage?
    var city : String?
    var category : String?
    var subCategory : String?
    var numberOfRooms : String?
    var villa: String?
    var isEditProduct : Bool = false

    @IBOutlet weak var logoImageView: UIImageView!
    
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
    var attributeList : [CategoryAttributes]?
    var attributeValues = [String]()
    var attributeIds = [String]()
    var superStackView = UIStackView()
    var offerAlbum = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SellYourItemPresenter(view: self)
        self.hideKeyboardWhenTappedAround()
        superStackView.axis = .vertical
        superStackView.alignment = .fill
        superStackView.distribution = .fillEqually //
        superStackView.spacing = 10
        superStackView.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(superStackView)
        for attr in attributeList!
        {
            createStackView(text: attr.name_en!)
            attributeIds.append(attr.attributeId!)
        }
        superStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20).isActive = true
        superStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10).isActive = true
        superStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10).isActive = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func createStackView(text : String)  {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill // .leading .firstBaseline .center .trailing .lastBaseline
        stackView.distribution = .fill //
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        superStackView.addArrangedSubview(stackView)
        stackView.trailingAnchor.constraint(equalTo: superStackView.trailingAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: superStackView.leadingAnchor, constant:  10).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        createLabel(stackView: stackView,title : text)
        createTextField(stackView: stackView)
        
    }
    
    func createTextField(stackView : UIStackView) {
        let textField = UITextField()
        textField.autocapitalizationType = UITextAutocapitalizationType.words
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.purple.cgColor
        textField.layer.borderWidth = 1
        textField.textAlignment = .center
        stackView.addArrangedSubview(textField)
        textField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
      
        textField.delegate = self
    }
    
    @IBAction func backBtn(_ sender: Any) {
          dismiss(animated: true, completion: nil)
    }
    
    
    func createLabel(stackView : UIStackView,title : String) {
        let label = UILabel()
        label.textAlignment = .center
        label.text = title
        label.widthAnchor.constraint(equalToConstant: 85).isActive = true
        label.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        label.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
        label.numberOfLines = 0
        stackView.addArrangedSubview(label)
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !(textField.text?.isEmpty)!
        {
            attributeValues.append(textField.text!)
        }
    }
    func setupLayout() {
        // Stack View
        
    }
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if ((attributeIds.count == attributeValues.count) && !attributeValues.isEmpty)
        {
            
            
            let sellYourItemFourthVC = storyboard?.instantiateViewController(withIdentifier:"SellYourItemFourthVC")as! SellYourItemFourthViewController
            sellYourItemFourthVC.city = city
            sellYourItemFourthVC.offerImage = offerImage
            sellYourItemFourthVC.category = category
            sellYourItemFourthVC.isEditProduct = isEditProduct
            sellYourItemFourthVC.subCategory = subCategory
            sellYourItemFourthVC.attributeValues = attributeValues
            sellYourItemFourthVC.attributeIds = attributeIds
            sellYourItemFourthVC.offerAlbum = offerAlbum
            sellYourItemFourthVC.isEditProduct = isEditProduct
            sellYourItemFourthVC.modalPresentationStyle = .fullScreen
            self.present(sellYourItemFourthVC,animated:true,completion: nil)
            
        }else
        {
            showError(error: "You Must Fill the data")
        }
    }
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error".localiz(), message: error.localiz(), preferredStyle: .alert)
                 let action = UIAlertAction(title: "OK".localiz(), style: .default, handler: nil)
                 alertController.addAction(action)
                 present(alertController, animated: true, completion: nil)
    }
    
    
}
