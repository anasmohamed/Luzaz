//
//  SellYourItemSecondPresenter.swift
//  Luzaz
//
//  Created by jets on 1/3/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
class SellYourItemSecondPresenter
{
    private weak var view: SellYourItemSecondView?
    private let sellYourItemInteractor: SellYourItemInteractor
    private var sellItem: Offer?
    
    init(view: SellYourItemSecondView) {
        self.view = view
        sellItem = Offer()
        sellYourItemInteractor = SellYourItemInteractor()
    }
   
    func setItemCategory(category : String)  {
        sellItem?.category = category
    }
    func setItemSubCategory(subCategory : String) {
        sellItem?.subCateogry = subCategory
    }
    func setItemBrand(brand : String) {
        sellItem?.brand = brand
    }

}
