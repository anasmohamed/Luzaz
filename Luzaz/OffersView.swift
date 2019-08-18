//
//  OffersView.swift
//  Luzaz
//
//  Created by jets on 12/16/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
protocol OffersView {
    func showIndicator()
    func hideIndicator()
    func getOffersSuccess()
    func showError(error: String)
    
}
