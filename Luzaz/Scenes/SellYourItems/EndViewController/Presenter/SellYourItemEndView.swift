//
//  SellYourItemEndView.swift
//  Luzaz
//
//  Created by Anas Mohamed on 10/19/19.
//  Copyright © 2019 Luzaz. All rights reserved.
//

import Foundation
protocol SellYourItemEndView:class {
    func showError(error : String)
    func offerAddedSuccessfully(message :String)
    func showSpinner()
    func hideSpinner()
    func updateOfferSuccessfully(message:String)
  
}
