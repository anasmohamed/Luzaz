//
//  OfferDetailesPresenter.swift
//  Luzaz
//
//  Created by jets on 1/17/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
class OfferDetailesPresenter {
    private weak var view: OfferDetailesView?
    private let offersInteractor: OffersInteractor
   
    init(view: OfferDetailesView?) {
        self.view = view
        offersInteractor = OffersInteractor()
      
    }
    
    func addProductToFavorite(token:String,offerId:String) {
        offersInteractor.addProductToFavorite(token:token,offerId: offerId) { [unowned self] (message, error) in
            
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let message = message else { return }
              
                self.view?.addProductToFavoriteSuccess(message)
            }
        }
    }
}
