//
//  SellYourItemFIfthPresenter.swift
//  Luzaz
//
//  Created by jets on 1/5/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
class SellYourItemFifthPresenter {
    private weak var view: SellYourItemView?
    private let sellYourItemInteractor: SellYourItemInteractor
    private var sellItem: Offer?
    
    init(view: SellYourItemView) {
        self.view = view
        sellItem = Offer()
        sellYourItemInteractor = SellYourItemInteractor()
    }
    func setItemPrice(price : String)  {
        sellItem?.price = price
    }
    func setItemPriceDiscount(discount : String)  {
        sellItem?.discount_prec = discount
    }
}
