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
    override func viewDidLoad() {
        super.viewDidLoad()
        setIconForBtn(button: homeBtn, icon:"home")
        setIconForBtn(button: chatBtn, icon: "chat")
        setIconForBtn(button: catategoryBtn, icon: "catago")
        setIconForBtn(button: favoriteBtn, icon:"favorites")
        setIconForBtn(button: countryBtn, icon: getCountyIcon(countryNum: UserDefaults.standard.string(forKey: "country")!))
        // Do any additional setup after loading the view.
    }
    func setIconForBtn(button : UIButton, icon : String)
    {
        let icon = UIImage(named: icon)!
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
    }
    
    @IBAction func languageBrnWasPressed(_ sender: Any) {
        
        
    }
    @IBAction func countryBrnWasPressed(_ sender: Any) {
        
    }
  
    @IBAction func winWithUsBtnWasPressed(_ sender: Any) {
    }
    @IBAction func sellYourItemsWasPressed(_ sender: Any) {
    }
    @IBAction func favoriteBtnWasPressed(_ sender: Any) {
    }
    @IBAction func chatBtnWasPressed(_ sender: Any) {
    }
    @IBAction func myProductWasPressed(_ sender: Any) {
    }
    @IBAction func categoriesBtnWasPressed(_ sender: Any) {
    }
    @IBAction func homeBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func regiterLoginBtnWasPressed(_ sender: Any) {
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
