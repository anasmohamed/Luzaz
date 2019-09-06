//
//  SellYourItemThirdPresenter.swift
//  Luzaz
//
//  Created by jets on 1/5/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
class SellYourItemThirdPresenter {
    private weak var view: SellYourItemThirdView?
    private let sellYourItemInteractor: SellYourItemInteractor
    private var sellItem: Offer?
    
    init(view: SellYourItemThirdView) {
        self.view = view
        sellItem = Offer()
        
        sellYourItemInteractor = SellYourItemInteractor()
    }
    
    func setAppartmentArea(area : String)  {
        sellItem?.appartment.area = area
    }
    func setAppartmentLevels(levels : String)  {
        sellItem?.appartment.levels = levels
    }
    func setAppartmentBedrooms(bedrooms: String)  {
        sellItem?.appartment.bedrooms = bedrooms
    }
    func setAppartmentBathrooms(bathrooms: String)  {
        sellItem?.appartment.bathrooms = bathrooms
    }
    func setAppartmentFinish(finish : String) {
        sellItem?.appartment.finished = finish
    }

}
