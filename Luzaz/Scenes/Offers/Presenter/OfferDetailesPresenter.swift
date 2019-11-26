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
    func addReportOffer(offer:String,title:String,message:String,email:String) {
           offersInteractor.addReportOffre(offer: offer, title: title, message: message, email: email) { [unowned self] (message, error) in
               
               if let error = error {
                   self.view?.showError(error: error.localizedDescription)
               } else {
                   guard message != nil else { return }
                 
                   self.view?.addProductToFavoriteSuccess(message: message ?? "")
               }
           }
       }
    func addProductToFavorite(token:String,offerId:String) {
        offersInteractor.addProductToFavorite(token:token,offerId: offerId) { [unowned self] (message, error) in
            
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard message != nil else { return }
              
                self.view?.addProductToFavoriteSuccess(message: message ?? "")
            }
        }
    }
}
