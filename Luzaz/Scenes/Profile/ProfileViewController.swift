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
    var prefs = UserDefaults.standard
    internal func logoutSuccess() {
     prefs.removeObject(forKey:"userId")
        prefs.removeObject(forKey:"token")
        prefs.removeObject(forKey:"fullName")
        prefs.removeObject(forKey:"email")
        prefs.removeObject(forKey:"password")
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
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
        presenter.logoutUser(user:UserDefaults.standard.string(forKey: "userId")!)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ProfilePresenter(view : self)
        counrty = UserDefaults.standard.string(forKey: "country")!
        userName = UserDefaults.standard.string(forKey: "fullName")!
        email = UserDefaults.standard.string(forKey: "email")!
        phone = UserDefaults.standard.string(forKey: "phone")!
        emailLbl.text = email
        userNameLbl.text = userName
        phoneLbl.text = phone
        getCountryImage()
    }
    func getCountryImage()
    {
        if counrty == "1"{
            
            countyImageView.image = UIImage(named:"egypt")
        
        }else if counrty == "2"
        {
            countyImageView.image = UIImage(named:"united-states-of-america-flag-round-icon-16")

        }
        else if counrty == "3"
        {
            countyImageView.image = UIImage(named:"emirates")
            
        }
        else if counrty == "4"
        {
            countyImageView.image = UIImage(named:"saudi_arabia")
            
        }
        else{
            countyImageView.image = UIImage(named:"libya-flag-round-icon-16")
 
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
