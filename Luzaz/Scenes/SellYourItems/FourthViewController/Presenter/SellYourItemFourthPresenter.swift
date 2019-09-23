//
//  SellYourItemFourthPresenter.swift
//  Luzaz
//
//  Created by jets on 1/5/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
class SellYourItemFourthPresenter
{
    private weak var view: SellYourItemFourthView?
    private let sellYourItemInteractor: SellYourItemInteractor
    private var sellItem: Offer?
    
    init(view: SellYourItemFourthView) {
        self.view = view
        sellItem = Offer()
        sellYourItemInteractor = SellYourItemInteractor()
    }
    
    func setItemCondition(conditon: String)  {
        sellItem?.condition = conditon
    }
    
    func setItemTitle(title:String)  {
        sellItem?.title = title
    }
    func setItemDescription(descrition: String){
       sellItem?.description = descrition
    }
}
