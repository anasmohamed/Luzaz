//
//  ChangePasswordView.swift
//  Luzaz
//
//  Created by jets on 1/25/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
protocol ChangePasswordView :class{
    func showIndicator()
    func hideIndicator()
    func changePasswordSuccess(message: String)
    func showError(error: String)
}
