//
//  ProfileViewController.swift
//  Luzaz
//
//  Created by jets on 1/25/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,ProfileView {
    @IBOutlet weak var countyImageView: UIImageView!
    
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    var presenter : ProfilePresenter!
    var counrty : String?
    var userName : String?
    var email :String?
    var phone :String?
    
    @IBOutlet weak var fullNameStackView: UIStackView!
    @IBOutlet weak var counrtyVerticalSpace: NSLayoutConstraint!
    @IBOutlet weak var emailVerticalSpace: NSLayoutConstraint!
    @IBOutlet weak var phoneVerticalConstrain: NSLayoutConstraint!
    @IBOutlet weak var counrtyStackView: UIStackView!
    @IBOutlet weak var emailStackView: UIStackView!
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var phoneStackView: UIStackView!
    var prefs = UserDefaults.standard
    internal func logoutSuccess() {
     prefs.removeObject(forKey:"userId")
        prefs.removeObject(forKey:"token")
        prefs.removeObject(forKey:"fullName")
        prefs.removeObject(forKey:"email")
        prefs.removeObject(forKey:"password")
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true, completion: nil)
    }
    func showError(error: String) {
        
    }

    @IBAction func changePasswordBtnWasPressed(_ sender: Any) {
        let changePasswordVC = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordViewController
        changePasswordVC.modalPresentationStyle = .fullScreen
    present(changePasswordVC, animated: true, completion: nil)
        
    }
    @IBAction func logutBtnWasPressed(_ sender: Any) {

        let alertController = UIAlertController(title: NSLocalizedString("Log out", comment: ""), message: NSLocalizedString("Are You Sure You Want To Log out?", comment: ""), preferredStyle: .alert)
        let action1 = UIAlertAction(title: NSLocalizedString("Yes", comment: ""), style: .default) { (_: UIAlertAction) in
            self.presenter.logoutUser(user:UserDefaults.standard.string(forKey: "userId")!)

            print("You've pressed Yes")
        }
        
        let action2 = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel) { (_: UIAlertAction) in
            print("You've pressed cancel")
        }
        alertController.addAction(action1)
        alertController.addAction(action2)
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ProfilePresenter(view : self)
       let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
             //    logoImageView.isUserInteractionEnabled = true
                 logoImageView.addGestureRecognizer(tapGestureRecognizer)
        
        counrty = UserDefaults.standard.string(forKey: "country") ?? ""
        userName = UserDefaults.standard.string(forKey: "fullName") ?? ""
        email = UserDefaults.standard.string(forKey: "email") ?? ""
        phone = UserDefaults.standard.string(forKey: "phone") ?? ""
        if email!.isEmpty {
            //emailLbl.isHidden = true
            //emailStackView.isHidden = true
            //emailVerticalSpace.isActive = false
            //counrtyVerticalSpace.isActive = false
            //counrtyStackView.topAnchor.constraint(equalTo: phoneStackView.bottomAnchor, constant: 20).isActive = true
        }else{
        emailLbl.text = email
    }
        userNameLbl.text = userName
        if phone!.isEmpty {
           // phoneLbl.isHidden = true
           // phoneStackView.isHidden = true
            //phoneVerticalConstrain.isActive = false
//            //emailVerticalSpace.isActive = false
            //emailStackView.topAnchor.constraint(equalTo: fullNameStackView.bottomAnchor, constant: 20).isActive = true

        }else{
        phoneLbl.text = phone
        }
        getCountryImage()
    }
    
    func getCountryImage()
    {
        if counrty == "1"{
            
            countyImageView.image = UIImage(named:"egypt")
            countryLbl.text = "Egypt".localiz()
        }else if counrty == "2"
        {
            countyImageView.image = UIImage(named:"united-states-of-america-flag-round-icon-16")
             countryLbl.text = "USA".localiz()
        }
        else if counrty == "3"
        {
            countyImageView.image = UIImage(named:"emirates")
            countryLbl.text = "Emirates".localiz()
        }
        else if counrty == "4"
        {
            countyImageView.image = UIImage(named:"saudi_arabia")
                        countryLbl.text = "SaudiArabia".localiz()

        }
        else{
            countyImageView.image = UIImage(named:"libya-flag-round-icon-16")
            countryLbl.text = "Libya".localiz()

        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
          let homeViewController = ContainerVC()
           homeViewController.modalPresentationStyle = .fullScreen
                 present(homeViewController, animated: true, completion: nil)
       }
}
