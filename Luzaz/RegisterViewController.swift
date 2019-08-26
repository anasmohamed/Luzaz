//
//  RegisterViewController.swift
//  Luzaz
//
//  Created by jets on 12/1/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var conPassTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    
    @IBAction func registerBtn(_ sender: UITextField) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        scroller.translatesAutoresizingMaskIntoConstraints = false
        scroller.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scroller.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scroller.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scroller.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
         // Do any additional setup after loading the view.
    }
    
  
    override func viewDidAppear(_ animated: Bool) {
        scroller.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+900)
    }
 
    
}
