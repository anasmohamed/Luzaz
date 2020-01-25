//
//  RegistrationView.swift
//  Luzaz
//
//  Created by jets on 12/23/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
protocol RegistrationView: class {
    func showIndicator()
    func hideIndicator()
    func registrationSuccess(message:String)
    func showError(error: String,title:String)
}
