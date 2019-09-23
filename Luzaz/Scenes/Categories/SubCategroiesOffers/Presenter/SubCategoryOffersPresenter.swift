//
//  SubCategoryOffersPresenter.swift
//  Luzaz
//
//  Created by jets on 1/16/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
class SubCategoryOffersPresenter {
    private weak var view: SubCategoryOffersView?
    private let subCategoryoffersInteractor: SubCategoryOffersInteractor
    private var subCategoryoffer: Offer?
    private var subCategoryOffers: [Offer]
    init(view: SubCategoryOffersView) {
        self.view = view
        subCategoryoffersInteractor = SubCategoryOffersInteractor()
        subCategoryOffers = [Offer]()
    }
    
    func viewDidLoad(mainCategoryId:String) {
        
        //        getOffers(countryId:UserDefaults.standard.string(forKey: "country")!
        getSubCategoryOffers(mainCategoryId:mainCategoryId)
    }
    
    func getSubCategoryOffers(mainCategoryId : String) {
        subCategoryoffersInteractor.getSubCategoryOffers(mainCategoryId:mainCategoryId) { [unowned self] (subCategoryOffers, error) in
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let subCategoryOffers = subCategoryOffers else { return }
                self.subCategoryOffers = subCategoryOffers
                self.view?.getSubCategoryOffersSuccess()
            }
        }
    }
    func getSubCategoryOffersCount() -> Int {
        return subCategoryOffers.count
    }
    
    func configure(cell: SubCategoryOffersCellView, for index: Int) {
        let subCategoryoffer = subCategoryOffers[index]
        
        guard let image = subCategoryoffer.image
            ,let productName = subCategoryoffer.title
            ,let productPrice = subCategoryoffer.price
            else { return }
        
        cell.showProductImage(image: image)
        cell.showProductNumber(number: productPrice)
        cell.showProductName(name: productName)
        
    }
    func pushToDetails(viewController : OffersDetailsViewController, _ index : Int) {
        viewController.offer = subCategoryOffers[index]
        
    }
}
