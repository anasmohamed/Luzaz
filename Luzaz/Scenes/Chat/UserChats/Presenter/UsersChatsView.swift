//
//  UsersChatsView.swift
//  Luzaz
//
//  Created by jets on 1/10/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
protocol UsersChatsView :class{
    func getUsersChatsSuccess()
    func showIndicator()
    func hideIndicator()
    func showError(error: String)
}
