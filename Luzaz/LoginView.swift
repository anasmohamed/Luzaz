//
//  LoginView.swift
//  Luzaz
//
//  Created by jets on 12/24/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
protocol LoginView: class {
    func showIndicator()
    func hideIndicator()
    func loginSuccess(user: User)
    func showError(error: String)
}
