//
//  PropertiesDetailsViewController.swift
//  Luzaz
//
//  Created by Anas Mohamed on 10/13/19.
//  Copyright © 2019 Luzaz. All rights reserved.
//

import UIKit

class PropertiesDetailsViewController: UIViewController,SellYourItemView {
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
    var attributeList : [CategoryAttributes]?
    var attributeValues : [String]?
    var attributeIds: [String]?
    var superStackView = UIStackView()
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
            attributeIds?.append(attr.attributeId!)
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
        textField.textAlignment = NSTextAlignment.center
        textField.textColor = UIColor.blue
        textField.borderStyle = UITextField.BorderStyle.line
        textField.autocapitalizationType = UITextAutocapitalizationType.words
        stackView.addArrangedSubview(textField)
        textField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        attributeValues?.append(textField.text!)
        
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
    func setupLayout() {
        // Stack View
        
    }
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if !(villaTextView.text?.isEmpty)! && !(numberOfRoomsTextView.text?.isEmpty)! 
        {
            villa = villaTextView.text
            numberOfRooms = numberOfRoomsTextView.text
            
            let sellYourItemFourthVC = storyboard?.instantiateViewController(withIdentifier:"SellYourItemFourthVC")as! SellYourItemFourthViewController
            sellYourItemFourthVC.city = city
            sellYourItemFourthVC.offerImage = offerImage
            sellYourItemFourthVC.category = category
            sellYourItemFourthVC.subCategory = subCategory
            sellYourItemFourthVC.villa = villa
            sellYourItemFourthVC.numberOfRooms = numberOfRooms
            
            self.present(sellYourItemFourthVC,animated:true,completion: nil)
            
        }else
        {
            showError(error: "You Must Fill the data")
        }
    }
    func showError(error: String) {
        
    }
    
    
}
