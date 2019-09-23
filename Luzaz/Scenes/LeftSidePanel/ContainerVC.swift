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

enum SliderOutState {
    
    case collapsed
    case leftPanelExpanded
}

enum ShowWhichVC {
    
    case OffersViewController
}

var showVC : ShowWhichVC = .OffersViewController

class ContainerVC: UIViewController {
    
    var offersViewController : OffersViewController!
    var leftVC : LeftSidePanelVC!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCenter(screen: showVC)
    }
    
    func initCenter(screen : ShowWhichVC) {
        
        var presentingController : UIViewController
        
        showVC = screen
        
        if offersViewController == nil
        {
            offersViewController = UIStoryboard.offersVC()
            offersViewController.delegate = self
        }
        
        presentingController = offersViewController
        
        if let con = centerController
        {
            con.view.removeFromSuperview()
            con.removeFromParentViewController()
        }
        
        centerController = presentingController
        
        view.addSubview(centerController.view)
        addChildViewController(centerController)
        centerController.didMove(toParentViewController: self)
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return UIStatusBarAnimation.slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isHidden
    }
}

extension ContainerVC : CenterVCDelegate {
    
    func toggleLeftPane() {
        
        let notAlreadyExpanded = (currentState != .leftPanelExpanded)
        
        if notAlreadyExpanded
        {
            addLeftPanelViewController()
        }
        animateLeftPanel(shouldExpand: notAlreadyExpanded)
    }
    
    func addLeftPanelViewController() {
        
        if leftVC == nil
        {
            leftVC = UIStoryboard.leftViewController()
            addChildSidePanelViewController(leftVC!)
        }
    }
    
    func addChildSidePanelViewController(_ sidePanelController: LeftSidePanelVC) {
        
        view.insertSubview(sidePanelController.view, at: 0)
        addChildViewController(sidePanelController)
        sidePanelController.didMove(toParentViewController: self)
    }
    
    func animateLeftPanel(shouldExpand: Bool) {
        
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
        tap = UITapGestureRecognizer(target: self, action: #selector(toggleLeftPane))
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
            centerController.view.layer.shadowOpacity = 0.6
        }
    }
    
    func animateStatusBar() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        })
    }
}

private extension UIStoryboard {
    
    class func mainStoryboard() -> UIStoryboard {
        
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func leftViewController() -> LeftSidePanelVC? {
        
        return mainStoryboard().instantiateViewController(withIdentifier: "LeftSidePanelVC") as? LeftSidePanelVC
    }
   
    class func CountryVC() -> CountriesViewController? {
        
        return mainStoryboard().instantiateViewController(withIdentifier: "CountryVC") as? CountriesViewController
    }
    class func offersVC() -> OffersViewController? {
        
        return mainStoryboard().instantiateViewController(withIdentifier: "OffersVC") as? OffersViewController
    }
}
