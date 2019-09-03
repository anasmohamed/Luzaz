//
//  SellYourItemPresenter.swift
//  Luzaz
//
//  Created by jets on 1/1/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
class SellYourItemPresenter {
    private weak var view: SellYourItemView?
    private let sellYourItemInteractor: SellYourItemInteractor
    private var sellItem: Offer?

    init(view: SellYourItemView) {
        self.view = view
        sellItem = Offer()
        sellYourItemInteractor = SellYourItemInteractor()
    }
    func setItemCity(cityIndex : Int)  {
        sellItem?.city = String(cityIndex)
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
