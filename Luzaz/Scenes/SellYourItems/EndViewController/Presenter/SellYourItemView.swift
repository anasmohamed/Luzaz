//
//  SellYourItemEndView.swift
//  Luzaz
//
//  Created by jets on 1/5/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
protocol SellYourItemView :class{
    func showError(error : String)
    func offerAddedSuccessfully(message :String)
    func showSpinner()
    func hideSpinner()
}
