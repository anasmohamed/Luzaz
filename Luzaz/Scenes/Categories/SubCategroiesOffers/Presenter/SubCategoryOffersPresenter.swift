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
    public var isOfferEmpty : Bool = false
    
    init(view: SubCategoryOffersView) {
        self.view = view
        subCategoryoffersInteractor = SubCategoryOffersInteractor()
        subCategoryOffers = [Offer]()
    }
    
    func viewDidLoad(subCategoryId : String,country: String,perPage:String,page:String) {
        
        //        getOffers(countryId:UserDefaults.standard.string(forKey: "country")!
        getSubCategoryOffers(subCategoryId: subCategoryId, country: country, perPage:perPage , page: page)
    }
    
    func getSubCategoryOffers(subCategoryId : String,country: String,perPage:String,page:String) {
        subCategoryoffersInteractor.getSubCategoryOffers(subCategoryId: subCategoryId, country: country, perPage:perPage , page: page){ [unowned self] (subCategoryOffers, error) in
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                if subCategoryOffers != nil{
                    if subCategoryOffers!.count != 0{
                        guard let subCategoryOffers = subCategoryOffers else { return }
                        self.subCategoryOffers += subCategoryOffers
                        self.view?.getSubCategoryOffersSuccess()
                    }}
                else{
                    self.isOfferEmpty = true
                }
                
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
            ,let productId = subCategoryoffer.offerId
            ,let productDate = subCategoryoffer.date
            else { return }
        
        cell.showProductImage(image: image)
        cell.showProductNumber(number: productPrice)
        cell.showProductName(name: productName)
        cell.setProductId(productId: productId)
        cell.showProductDate(date: productDate)
    }
    func pushToDetails(viewController : OffersDetailsViewController, _ index : Int) {
        viewController.offer = subCategoryOffers[index]
        
    }
}
