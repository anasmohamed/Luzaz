//
//  SubCategoryOffersCellView.swift
//  Luzaz
//
//  Created by jets on 1/16/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
protocol SubCategoryOffersCellView {
    func showProductImage(image : String)
    func showProductName(name : String)
    func showProductNumber(number : String)
    func showProductDate(date : String)
    func setProductId(productId:String)
    

}
