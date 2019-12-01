//
//  MyProductView.swift
//  Luzaz
//
//  Created by jets on 1/18/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
protocol MyProductView : class{
    func showIndicator()
    func hideIndicator()
    func getMySellingProductsSuccess()
    func getMyOrdersSuccess()
    func showError(error: String)
    func offerDeletedSuccessfuly(message:String)
    
}
