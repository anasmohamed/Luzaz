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
    
    @IBOutlet weak var userNameLbl: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    var presenter : ProfilePresenter!
    internal func logoutSuccess() {
        
    }
    func showError(error: String) {
        
    }

    @IBAction func changePasswordBtnWasPressed(_ sender: Any) {
    }
    @IBAction func logutBtnWasPressed(_ sender: Any) {
        presenter.logoutUser(user:UserDefaults.standard.string(forKey: "userId")!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ProfilePresenter(view : self)
    }

}
