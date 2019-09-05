//
//  OffersPresenter.swift
//  Luzaz
//
//  Created by jets on 12/16/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import UIKit
class OffersPresenter{
    
    private weak var view: OffersView?
    private let offersInteractor: OffersInteractor
    private var offer: Offer?
    private var offers: [Offer]
    private var filteredOffers : [Offer]
    init(view: OffersView) {
        self.view = view
        offersInteractor = OffersInteractor()
        offers = [Offer]()
        filteredOffers = offers
    }

    func viewDidLoad() {
        
//        getOffers(countryId:UserDefaults.standard.string(forKey: "country")!
            getOffers(countryId: "1")
// )
    }
    
    func getOffers(countryId: String) {
        view?.showIndicator()
        offersInteractor.getOffers(countryId: countryId) { [unowned self] (offers, error) in
            
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let offers = offers else { return }
                self.offers = offers
                self.filteredOffers = offers
                self.view?.getOffersSuccess()
            }
        }
    }
    func getOffersCount() -> Int {
        return offers.count
    }
    func getFilteredOffersCount() -> Int {
        return filteredOffers.count
    }
    func getSearchedOffer(searchText : String) {
     filteredOffers =  offers.filter({( offer : Offer) -> Bool in
            return (offer.title?.lowercased().contains(searchText.lowercased()))!
        })

      
    }
    
    func configure(cell: OffersCellView, for index: Int,isFiltering : Bool) {
        let offer = filteredOffers[index]
//        if isFiltering {
//            offer = filteredOffers[index]
//        }else{
//            offer = offers[index]
//        }
        guard let image = offer.image
             else { return }
        
        cell.displayOfferImage(offerImage: image)
    }
    func pushToDetails(viewController : OffersDetailsViewController, _ index : Int) {
       viewController.offer = offers[index]
        
    }
}


