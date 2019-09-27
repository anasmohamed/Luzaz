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
    @IBOutlet weak var winBtn: UIButton!
    @IBOutlet weak var countryBtn: UIButton!
    @IBOutlet weak var sellBtn: UIButton!
    @IBOutlet weak var chatBtn: UIButton!
    @IBOutlet weak var myProducatBtn: UIButton!
    @IBOutlet weak var catategoryBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    let appDelegate = AppDelegate.getAppDelegate()

    @IBOutlet weak var countryImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setIconForBtn(button: homeBtn, icon:"home")
//        setIconForBtn(button: chatBtn, icon: "chat")
//        setIconForBtn(button: catategoryBtn, icon: "catago")
//        setIconForBtn(button: favoriteBtn, icon:"favorites")
//        setIconForBtn(button: countryBtn, icon: getCountyIcon(countryNum: UserDefaults.standard.string(forKey: "country")!))
        // Do any additional setup after loading the view.
    }
    func setIconForBtn(button : UIButton, icon : String)
    {
        
       

       
    }
    
    @IBAction func languageBrnWasPressed(_ sender: Any) {
        
        
    }
    @IBAction func countryBrnWasPressed(_ sender: Any) {
        let countryVC = storyboard?.instantiateViewController(withIdentifier: "CountryVC") as! CountriesViewController
        self.present(countryVC, animated: true, completion: nil)
    }
  
    @IBAction func winWithUsBtnWasPressed(_ sender: Any) {
        let competitionVC = storyboard?.instantiateViewController(withIdentifier: "") as! CountriesViewController
        self.present(competitionVC, animated: true, completion: nil)
    }
    @IBAction func sellYourItemsWasPressed(_ sender: Any) {
        let countryVC = storyboard?.instantiateViewController(withIdentifier: "SellYourItemFirstVC") as! SellYourItemViewController
        self.present(countryVC, animated: true, completion: nil)
    }
    @IBAction func favoriteBtnWasPressed(_ sender: Any) {
        let favoriteVC = storyboard?.instantiateViewController(withIdentifier: "FavoriteVC") as! SellYourItemViewController
        self.present(favoriteVC, animated: true, completion: nil)
    }
    @IBAction func chatBtnWasPressed(_ sender: Any) {
        let userBuddiesVC = storyboard?.instantiateViewController(withIdentifier: "UserBuddiesVC") as! UsersChatsViewController
        self.present(userBuddiesVC, animated: true, completion: nil)
        
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
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        self.present(loginVC, animated: true, completion: nil)
    }
    func getCountyIcon(countryNum : String) -> String {
        switch countryNum {
        case "1":
            return "egypt-flag-round-icon-16"
            case "2":
            return "united-states-of-america-flag-round-icon-16"
        case "3":
            return "united-arab-emirates-flag-round-icon-16"
            case "4":
            return "saudi-arabia-flag-round-icon-16"
        default:
            return "libya-flag-round-icon-16"
        }
    }
}
