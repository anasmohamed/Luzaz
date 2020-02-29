//
//  RestetPasswordView.swift
//  Luzaz
//
//  Created by Anas Mohamed on 2/29/20.
//  Copyright © 2020 Luzaz. All rights reserved.
//

import Foundation
protocol ResetPasswordView :class{
    func showIndicator()
    func hideIndicator()
    func resetPasswordSuccess(message: String)
    func showError(error: String)
}
