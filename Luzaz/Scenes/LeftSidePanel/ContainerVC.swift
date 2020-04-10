//
//  ContainerVC.swift
//  Luzaz
//
//  Created by jets on 12/18/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore
import MOLH
enum SliderOutState {
    case collapsed
    case leftPanelExpanded
    case rightPanelExpanded

}

enum ShowWhichVC {
    case CountriesViewController
    case OffersViewController
}

var showVC : ShowWhichVC = .OffersViewController

class ContainerVC: UIViewController {
    
    var offersViewController : OffersViewController!
    var countriesViewController : CountriesViewController!
    var leftVC : LeftSidePanelVC!
    var rightVC : RightSidePanelVC!
    var centerController : UIViewController!
    var currentState : SliderOutState = .collapsed {
        didSet{
            let shouldShowShadow = (currentState != .collapsed)
            shouldShowShadowForCenterViewController(status: shouldShowShadow)
        }
    }
    var isHidden = false
    let centerPanelExpandedOffset : CGFloat = 130
    var tap : UITapGestureRecognizer!
    var language : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate

        initCenter(screen: showVC)
    }
    
    func initCenter(screen : ShowWhichVC) {
        
        var presentingController : UIViewController
        
        showVC = screen
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "isFirstTime") == nil {
            defaults.set("No", forKey:"isFirstTime")
            defaults.synchronize()
            
            if countriesViewController == nil
            {
                countriesViewController = UIStoryboard.countriesVC()
                countriesViewController.delegate = self
                offersViewController = UIStoryboard.offersVC()
                offersViewController.delegate = self
            }
            presentingController = countriesViewController
            
        }else{
            if offersViewController == nil
            {
                offersViewController = UIStoryboard.offersVC()
                offersViewController.delegate = self
            }
            presentingController = offersViewController
            
        }
        
        
        
        if let con = centerController
        {
            con.view.removeFromSuperview()
            con.removeFromParent()
        }
        
        centerController = presentingController
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return UIStatusBarAnimation.slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isHidden
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        language = MOLHLanguage.currentAppleLanguage()

    }
}

extension ContainerVC : CenterVCDelegate {
    func togglePane()
    {
        if language == "en"
        {
            toggleLeftPane()
        }
        else{
            toggleRightPane()
        }
    }
    @objc func toggleLeftPane() {
        
        let notAlreadyExpanded = (currentState != .leftPanelExpanded)
        
        if notAlreadyExpanded
        {
            addLeftPanelViewController()
        }
        animateLeftPanel(shouldExpand: notAlreadyExpanded)
    }
    @objc func toggleRightPane() {
           
           let notAlreadyExpanded = (currentState != .rightPanelExpanded)
           
           if notAlreadyExpanded
           {
               addRightPanelViewController()
           }
           animateRightPanel(shouldExpand: notAlreadyExpanded)
       }
    func addLeftPanelViewController() {
        
        if leftVC == nil
        {
            leftVC = UIStoryboard.leftViewController()
            addChildSidePanelViewController(leftVC!)
        }
    }
    
      func addRightPanelViewController() {
          
          if rightVC == nil
          {
              rightVC = UIStoryboard.rightViewController()
              addChildSidePanelViewController(rightVC!)
          }
      }
      
    
    func addChildSidePanelViewController(_ sidePanelController: UIViewController) {
        
        view.insertSubview(sidePanelController.view, at: 0)
        addChild(sidePanelController)
        sidePanelController.didMove(toParent: self)
    }
    
    @objc func animateLeftPanel(shouldExpand: Bool) {
        
        if shouldExpand
        {
            isHidden = !isHidden
            animateStatusBar()
            setupWhiteCoverView()
            currentState = .leftPanelExpanded
            animateCenterPanelXPosition(targetPosition: centerController.view.frame.width - centerPanelExpandedOffset)
        }
        else
        {
            isHidden = !isHidden
            animateStatusBar()
            hideWhiteCoverView()
            animateCenterPanelXPosition(targetPosition: 0, completion: { (finished) in
                if finished == true
                {
                    self.currentState = .collapsed
                    self.leftVC = nil
                }
            })
        }
    }
    @objc func animateRightPanel(shouldExpand: Bool) {
        
        if shouldExpand
        {
            isHidden = !isHidden
            animateStatusBar()
            setupWhiteCoverView()
            currentState = .rightPanelExpanded
            animateCenterPanelXPosition(targetPosition: -centerController.view.frame.width + centerPanelExpandedOffset)
        }
        else
        {
            isHidden = !isHidden
            animateStatusBar()
            hideWhiteCoverView()
            animateCenterPanelXPosition(targetPosition: 0, completion: { (finished) in
                if finished == true
                {
                    self.currentState = .collapsed
                    self.rightVC = nil
                }
            })
        }
    }
    func animateCenterPanelXPosition(targetPosition : CGFloat, completion : ((Bool) -> Void)! = nil) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            
            self.centerController.view.frame.origin.x = targetPosition
            
        }, completion: completion)
    }
    
    func setupWhiteCoverView() {
        
        let whiteCoverView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        whiteCoverView.alpha = 0.0
        whiteCoverView.backgroundColor = UIColor.white
        whiteCoverView.tag = 25
        
        self.centerController.view.addSubview(whiteCoverView)
        UIView.animate(withDuration: 0.2)
        {
            whiteCoverView.alpha = 0.75
        }
        if language == "en"{
        tap = UITapGestureRecognizer(target: self, action:#selector(animateLeftPanel(shouldExpand:)))
        }else{
            tap = UITapGestureRecognizer(target: self, action:#selector(animateRightPanel(shouldExpand:)))
        }
        tap.numberOfTapsRequired = 1
        self.centerController.view.addGestureRecognizer(tap)
    }
    
    func hideWhiteCoverView() {
        
        centerController.view.removeGestureRecognizer(tap)
        
        for subview in self.centerController.view.subviews
        {
            if subview.tag == 25
            {
                UIView.animate(withDuration: 0.2, animations: {
                    
                    subview.alpha = 0.0
                    
                }, completion: { (finished) in
                    
                    subview.removeFromSuperview()
                })
            }
        }
    }
    
    func shouldShowShadowForCenterViewController(status : Bool) {
        
        if status == true
        {
            centerController.view.layer.shadowOpacity = 0.6
        }
        else
        {
            centerController.view.layer.shadowOpacity = 0
        }
    }
    
    func animateStatusBar() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        })
    }
}

extension UIStoryboard {
    
    class func mainStoryboard() -> UIStoryboard {
        
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func leftViewController() -> LeftSidePanelVC? {
        
        return mainStoryboard().instantiateViewController(withIdentifier: "LeftSidePanelVC") as? LeftSidePanelVC
    }
    class func rightViewController() -> RightSidePanelVC? {
        
        return mainStoryboard().instantiateViewController(withIdentifier: "RightSidePanelVC") as? RightSidePanelVC
    }
    
    class func CountryVC() -> CountriesViewController? {
        
        return mainStoryboard().instantiateViewController(withIdentifier: "CountryVC") as? CountriesViewController
    }
    class func offersVC() -> OffersViewController? {
        
        return mainStoryboard().instantiateViewController(withIdentifier: "OffersVC") as? OffersViewController
    }
    class func countriesVC() -> CountriesViewController? {
        
        return mainStoryboard().instantiateViewController(withIdentifier: "CountriesVC") as? CountriesViewController
    }
}
