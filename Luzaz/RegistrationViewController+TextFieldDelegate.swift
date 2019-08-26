//
//  RegistrationViewController+TextFieldDelegate.swift
//  Luzaz
//
//  Created by jets on 12/24/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//


import UIKit

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
