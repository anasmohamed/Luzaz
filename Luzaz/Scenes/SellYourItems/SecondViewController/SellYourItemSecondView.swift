//
//  SellYourItemSecondView.swift
//  Luzaz
//
//  Created by jets on 1/29/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
protocol SellYourItemSecondView:class {
    func getBrandsSuccess()
    func showError(error : String)
    func showIndicator()
    func hideIndicator()
}
