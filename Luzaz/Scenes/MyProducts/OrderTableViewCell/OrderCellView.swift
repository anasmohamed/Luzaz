//
//  OrderCellView.swift
//  Luzaz
//
//  Created by jets on 1/29/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
protocol OrderCellView {
    func displayDate(date: String)
    func displayProductTotalPrice(productTotalPrice: String)
    func displayProductPrice(price :String)
    func displayProductQuntity(quntity: String)
}
