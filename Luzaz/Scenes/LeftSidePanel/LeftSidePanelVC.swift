//
//  LiftSidePanelVC.swift
//  Luzaz
//
//  Created by jets on 12/18/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import UIKit

class LeftSidePanelVC: UIViewController{
    
    
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
    var countries = CountriesViewController()
    
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("nubmer \(UserDefaults.standard.string(forKey: "country")!)")

        print("nubmer \(getCountyIcon(countryNum: UserDefaults.standard.string(forKey: "country")!))")
        countryImageView.image = UIImage(named:getCountyIcon(countryNum: UserDefaults.standard.string(forKey: "country")!))
        countryBtn.setTitle(getCountyIcon(countryNum: UserDefaults.standard.string(forKey: "country")!), for: .normal)
        if (token.isEmpty){
            registerBtn.setTitle("Register/Login", for: .normal)
        }
        else{
            registerBtn.setTitle("my profile", for: .normal)
        }
        
    }
    
    @IBAction func languageBrnWasPressed(_ sender: Any) {
        let languageVC = storyboard?.instantiateViewController(withIdentifier: "LangaugesVC") as! LanguagesViewController
        languageVC.modalPresentationStyle = .fullScreen
        self.present(languageVC, animated: true, completion: nil)
        
    }
    @IBAction func countryBrnWasPressed(_ sender: Any) {
        let countryVC = storyboard?.instantiateViewController(withIdentifier: "CountriesVC") as! CountriesViewController
        countryVC.isLeftSideController = true
        countryVC.countryImage = countryImageView
        countryVC.modalPresentationStyle = .fullScreen
        countryBtn.setTitle(getCountyIcon(countryNum: UserDefaults.standard.string(forKey: "country")!), for:.normal)
        self.present(countryVC, animated: true, completion: nil)
    }
    
    @IBAction func winWithUsBtnWasPressed(_ sender: Any) {
        if !(token.isEmpty){
            let competitionVC = storyboard?.instantiateViewController(withIdentifier: "UserCompetitionVC") as! UserCompetitionViewController
            competitionVC.modalPresentationStyle = .fullScreen
            self.present(competitionVC, animated: true, completion: nil)
        }else{
            appDelegate.MenuContainerVC.toggleLeftPane()
            showError(error: "you should login".localiz())
        }
    }
    @IBAction func sellYourItemsWasPressed(_ sender: Any) {
        if !(token.isEmpty){
            let sellYourItemVC = storyboard?.instantiateViewController(withIdentifier: "SellYourItemFirstVC") as! SellYourItemViewController
            sellYourItemVC.modalPresentationStyle = .fullScreen
            self.present(sellYourItemVC, animated: true, completion: nil)
        }
        else{
            appDelegate.MenuContainerVC.toggleLeftPane()
            
            showError(error: "you should login".localiz())
            
        }
    }
    @IBAction func favoriteBtnWasPressed(_ sender: Any) {
        if !(token.isEmpty) {
            let favoriteVC = storyboard?.instantiateViewController(withIdentifier: "FavoriteVC") as! FavoriteOffersViewController
            favoriteVC.modalPresentationStyle = .fullScreen
            self.present(favoriteVC, animated: true, completion: nil)
        }else
        {            appDelegate.MenuContainerVC.toggleLeftPane()
            
            showError(error: "you should login".localiz())
        }
    }
    @IBAction func chatBtnWasPressed(_ sender: Any) {
        if !(token.isEmpty){
            let userBuddiesVC = storyboard?.instantiateViewController(withIdentifier: "UserBuddiesVC") as! UsersChatsViewController
            userBuddiesVC.modalPresentationStyle = .fullScreen
            self.present(userBuddiesVC, animated: true, completion: nil)
        }
        else{
            appDelegate.MenuContainerVC.toggleLeftPane()
            
            showError(error: "you should login".localiz())
        }
    }
    @IBAction func myProductWasPressed(_ sender: Any) {
        if !(token.isEmpty){
                let myProductsVC = storyboard?.instantiateViewController(withIdentifier: "MyProductsVC") as! MyProductViewController
            myProductsVC.modalPresentationStyle = .fullScreen
                self.present(myProductsVC, animated: true, completion: nil)
            }
            else{
                appDelegate.MenuContainerVC.toggleLeftPane()
                
                showError(error: "you should login".localiz())
            }
    }
    @IBAction func categoriesBtnWasPressed(_ sender: Any) {
        let categoriesVC = storyboard?.instantiateViewController(withIdentifier: "MainCategoriesVC") as! MainCateogriesViewController
        categoriesVC.modalPresentationStyle = .fullScreen
        self.present(categoriesVC, animated: true, completion: nil)
    }
    @IBAction func homeBtnWasPressed(_ sender: Any) {
        let homeViewController = ContainerVC()
        homeViewController.modalPresentationStyle = .fullScreen
              present(homeViewController, animated: true, completion: nil)
    }
    
    @IBAction func regiterLoginBtnWasPressed(_ sender: Any) {
        appDelegate.MenuContainerVC.toggleLeftPane()
        if (token.isEmpty) {
            registerBtn.titleLabel?.text = "Register/login"
            let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true, completion: nil)
        }else{
            registerBtn.titleLabel?.text = "my profile"
            let profileVC = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileViewController
            profileVC.modalPresentationStyle = .fullScreen
            self.present(profileVC, animated: true, completion: nil)
        }
    }
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error".localiz(), message: error.localiz(), preferredStyle: .alert)
        let action = UIAlertAction(title: "OK".localiz(), style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    func getCountyIcon(countryNum : String) -> String {
        switch countryNum {
        case "1":
            return "egypt"
        case "10":
            return "usa"
        case "2":
            return "emirates"
        case "5":
            return "saudi arabia"
        default:
            return "libya"
        }
    }
}
