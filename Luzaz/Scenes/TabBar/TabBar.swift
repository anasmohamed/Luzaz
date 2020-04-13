//
//  TabBar.swift
//  Luzaz
//
//  Created by Anas Mohamed on 4/11/20.
//  Copyright © 2020 Luzaz. All rights reserved.
//

import UIKit

class TabBar: UIView {

  let nibName = "TabBar"
    @IBOutlet weak var homeBtn: UIButton!
    
    @IBOutlet weak var categoryBtn: UIButton!
    @IBOutlet weak var myProductBtn: UIButton!
    @IBOutlet weak var sellYourItemsBtn: UIButton!
    @IBOutlet weak var profileBtn: UIButton!
    
    @IBAction func categoryBtnWasPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
        let vc: MainCateogriesViewController = storyboard.instantiateViewController(withIdentifier: "OffersVC") as! MainCateogriesViewController
             let currentController = self.getCurrentViewController()
        currentController?.present(vc, animated: false, completion: nil)
    }
    
    @IBAction func myProductBtnWasPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
        let vc: MyProductViewController = storyboard.instantiateViewController(withIdentifier: "OffersVC") as! MyProductViewController
             let currentController = self.getCurrentViewController()
        currentController?.present(vc, animated: false, completion: nil)
    }
    @IBAction func sellYourItemWasPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
             let vc: SellYourItemViewController = storyboard.instantiateViewController(withIdentifier: "OffersVC") as! SellYourItemViewController
                  let currentController = self.getCurrentViewController()
             currentController?.present(vc, animated: false, completion: nil)
    }
    
    @IBAction func profileBtnWasPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
             let vc: ProfileViewController = storyboard.instantiateViewController(withIdentifier: "OffersVC") as! ProfileViewController
                  let currentController = self.getCurrentViewController()
             currentController?.present(vc, animated: false, completion: nil)
    }
    @IBAction func homeBtnWasPressed(_ sender: Any) {
        homeBtn.setImage(UIImage(named: "home-24red"), for: .normal)
           let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
        let vc: OffersViewController = storyboard.instantiateViewController(withIdentifier: "OffersVC") as! OffersViewController
             let currentController = self.getCurrentViewController()
        currentController?.present(vc, animated: false, completion: nil)

    }
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         commonInit()
        
     }
     
     override init(frame: CGRect) {
         super.init(frame: frame)

         commonInit()
     
     }
     
     func commonInit() {
         guard let view = loadViewFromNib() else { return }
         view.frame = bounds
         addSubview(view)
       
     }
     
     func loadViewFromNib() -> UIView? {
         let nib = UINib(nibName: nibName, bundle: nil)
        
         return nib.instantiate(withOwner: self, options: nil).first as? UIView
     }
func getCurrentViewController() -> UIViewController? {
        if let rootController = UIApplication.shared.keyWindow?.rootViewController {
            var currentController: UIViewController! = rootController
            while( currentController.presentedViewController != nil ) {
                currentController = currentController.presentedViewController
            }
            return currentController
        }
        return nil

    }
}
