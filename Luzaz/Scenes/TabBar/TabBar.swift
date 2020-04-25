//
//  TabBar.swift
//  Luzaz
//
//  Created by Anas Mohamed on 4/11/20.
//  Copyright © 2020 Luzaz. All rights reserved.
//

import UIKit
public protocol ButtonIconDelegate {
    func changeBtnIcon()
    func changeMyProductBtnIcon()
}

class TabBar: UIView ,ButtonIconDelegate{
    
    let nibName = "TabBar"
    @IBOutlet weak var homeBtn: UIButton!
    var delegate : OffersReloadDelegate?
    @IBOutlet weak var categoryBtn: UIButton!
    @IBOutlet weak var myProductBtn: UIButton!
    @IBOutlet weak var sellYourItemsBtn: UIButton!
    @IBOutlet weak var profileBtn: UIButton!
    let appDelegate = AppDelegate.getAppDelegate()
    var offersVC: OffersViewController?
    var token : String = ""
    var gradinatLayer : CAGradientLayer?
    
    @IBAction func categoryBtnWasPressed(_ sender: Any) {
        if UserDefaults.standard.string(forKey: "token") != nil
        {
            token = UserDefaults.standard.string(forKey: "token")!
        }
        if !(token.isEmpty){
            let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
            let vc: UsersChatsViewController = storyboard.instantiateViewController(withIdentifier: "UserBuddiesVC") as! UsersChatsViewController
            vc.modalPresentationStyle = .fullScreen
            let currentController = self.getCurrentViewController()
            if !(currentController is UsersChatsViewController){
                currentController?.present(vc, animated: false, completion: nil)}}
        else{
            
            showError(error: "you should login".localiz())
        }
    }
    
    @IBAction func myProductBtnWasPressed(_ sender: Any) {
        if UserDefaults.standard.string(forKey: "token") != nil
        {
            token = UserDefaults.standard.string(forKey: "token")!
        }
        if !(token.isEmpty){
            let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
            let vc: MyProductViewController = storyboard.instantiateViewController(withIdentifier: "MyProductsVC") as! MyProductViewController
            vc.modalPresentationStyle = .fullScreen
            let currentController = self.getCurrentViewController()
            if !(currentController is MyProductViewController){
                currentController?.present(vc, animated: false, completion: nil)}
        }else{
            
            showError(error: "you should login".localiz())
        }
    }
    @IBAction func sellYourItemWasPressed(_ sender: Any) {
        if UserDefaults.standard.string(forKey: "token") != nil
        {
            token = UserDefaults.standard.string(forKey: "token")!
        }
        if !(token.isEmpty){
            let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
            let vc: SellYourItemViewController = storyboard.instantiateViewController(withIdentifier: "SellYourItemFirstVC") as! SellYourItemViewController
            vc.modalPresentationStyle = .fullScreen
            
            let currentController = self.getCurrentViewController()
            currentController?.present(vc, animated: false, completion: nil)}
        else{
            showError(error: "you should login".localiz())
        }
    }
    
    @IBAction func profileBtnWasPressed(_ sender: Any) {
        if UserDefaults.standard.string(forKey: "token") != nil
        {
            token = UserDefaults.standard.string(forKey: "token")!
        }
        if !(token.isEmpty){
            let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
            let vc: ProfileViewController = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileViewController
            vc.modalPresentationStyle = .fullScreen
            
            let currentController = self.getCurrentViewController()
            currentController?.present(vc, animated: false, completion: nil)}else{
            let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
            let vc: LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
            vc.modalPresentationStyle = .fullScreen
            
            let currentController = self.getCurrentViewController()
            currentController?.present(vc, animated: false, completion: nil)
            
        }
        
    }
    @IBAction func homeBtnWasPressed(_ sender: Any) {
        let homeViewController = ContainerVC()
    
        homeViewController.modalPresentationStyle = .fullScreen
       let currentController = self.getCurrentViewController()
        if !(currentController is ContainerVC){
            currentController?.present(homeViewController, animated: false, completion: nil)}
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awak")
     

        homeBtn.setImage(UIImage(named: "home-24red"), for: .normal)
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
        
    }
    func changeBtnIcon()
    {
        homeBtn.setImage(UIImage(named: "home-24"), for: .normal)
        
        categoryBtn.setImage(UIImage(named: "chat-red"), for: .normal)
    }
    func changeMyProductBtnIcon(){
        homeBtn.setImage(UIImage(named: "home-24"), for: .normal)
        
        myProductBtn.setImage(UIImage(named: "pric_tag_red"), for: .normal)
        
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        let gradientLayer = CAGradientLayer()
             gradientLayer.colors = [UIColor.black, UIColor.white]
                   gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
                   gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
                   gradientLayer.locations = [0, 1]
        gradientLayer.frame = view.bounds

                   view.layer.insertSublayer(gradientLayer, at: 0)
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
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setGradientBackground(colorTop: .clear, colorBottom: .darkGray)

        
    }
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error".localiz(), message: error.localiz(), preferredStyle: .alert)
        let action = UIAlertAction(title: "OK".localiz(), style: .default, handler: nil)
        alertController.addAction(action)
        self.window?.rootViewController?.present(alertController, animated: true, completion: nil)
        
        // present(alertController, animated: true, completion: nil)
    }
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
      
    }
}
