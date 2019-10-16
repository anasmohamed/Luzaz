//
//  LiftSidePanelVC.swift
//  Luzaz
//
//  Created by jets on 12/18/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import UIKit

class LeftSidePanelVC: UIViewController {
    @IBOutlet weak var favoriteBtn: UIButton!
    @IBOutlet weak var counrtyImage: UIImageView!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var winBtn: UIButton!
    @IBOutlet weak var countryBtn: UIButton!
    @IBOutlet weak var sellBtn: UIButton!
    @IBOutlet weak var chatBtn: UIButton!
    @IBOutlet weak var myProducatBtn: UIButton!
    @IBOutlet weak var catategoryBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    let appDelegate = AppDelegate.getAppDelegate()
    var token : String = ""
    @IBOutlet weak var countryImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        countryImageView.image = UIImage(named:getCountyIcon(countryNum: UserDefaults.standard.string(forKey: "country")!))
        if UserDefaults.standard.string(forKey: "token") != nil
        {
            token = UserDefaults.standard.string(forKey: "token")!
        }
        if (token.isEmpty){
            registerBtn.setTitle("Register/Login", for: .normal)
        }
        else{
            registerBtn.setTitle("my profile", for: .normal)
        }
        
    }
    
    
    @IBAction func languageBrnWasPressed(_ sender: Any) {
        let languageVC = storyboard?.instantiateViewController(withIdentifier: "LangaugesVC") as! LanguagesViewController
        self.present(languageVC, animated: true, completion: nil)
        
    }
    @IBAction func countryBrnWasPressed(_ sender: Any) {
        let countryVC = storyboard?.instantiateViewController(withIdentifier: "CountriesVC") as! CountriesViewController
        countryVC.isLeftSideController = true
        countryVC.countryImage = countryImageView
        self.present(countryVC, animated: true, completion: nil)
    }
    
    @IBAction func winWithUsBtnWasPressed(_ sender: Any) {
        if !(token.isEmpty){
            let competitionVC = storyboard?.instantiateViewController(withIdentifier: "") as! CountriesViewController
            self.present(competitionVC, animated: true, completion: nil)
        }else{
            appDelegate.MenuContainerVC.toggleLeftPane()
            showError(error: "you should login")
        }
    }
    @IBAction func sellYourItemsWasPressed(_ sender: Any) {
        if !(token.isEmpty){
            let countryVC = storyboard?.instantiateViewController(withIdentifier: "SellYourItemFirstVC") as! SellYourItemViewController
            self.present(countryVC, animated: true, completion: nil)
        }
        else{
            appDelegate.MenuContainerVC.toggleLeftPane()
            
            showError(error: "you should login")
            
        }
    }
    @IBAction func favoriteBtnWasPressed(_ sender: Any) {
        if !(token.isEmpty) {
            let favoriteVC = storyboard?.instantiateViewController(withIdentifier: "FavoriteVC") as! SellYourItemViewController
            self.present(favoriteVC, animated: true, completion: nil)
        }else
        {            appDelegate.MenuContainerVC.toggleLeftPane()
            
            showError(error: "you should login")
        }
    }
    @IBAction func chatBtnWasPressed(_ sender: Any) {
        if !(token.isEmpty){
            let userBuddiesVC = storyboard?.instantiateViewController(withIdentifier: "UserBuddiesVC") as! UsersChatsViewController
            self.present(userBuddiesVC, animated: true, completion: nil)
        }
        else{
            appDelegate.MenuContainerVC.toggleLeftPane()
            
            showError(error: "you should login")
        }
    }
    @IBAction func myProductWasPressed(_ sender: Any) {
    }
    @IBAction func categoriesBtnWasPressed(_ sender: Any) {
        let categoriesVC = storyboard?.instantiateViewController(withIdentifier: "MainCategoriesVC") as! MainCateogriesViewController
        self.present(categoriesVC, animated: true, completion: nil)
    }
    @IBAction func homeBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func regiterLoginBtnWasPressed(_ sender: Any) {
        appDelegate.MenuContainerVC.toggleLeftPane()
        if (token.isEmpty) {
            registerBtn.titleLabel?.text = "Register/login"
            let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
            self.present(loginVC, animated: true, completion: nil)
        }else{
            registerBtn.titleLabel?.text = "my profile"
            let profileVC = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileViewController
            self.present(profileVC, animated: true, completion: nil)
        }
    }
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    func getCountyIcon(countryNum : String) -> String {
        switch countryNum {
        case "1":
            return "egypt"
        case "2":
            return "usa"
        case "3":
            return "emirates"
        case "4":
            return "saudi_arabia"
        default:
            return "libya"
        }
    }
}
