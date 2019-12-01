//
//  FavoritePresenter.swift
//  Luzaz
//
//  Created by jets on 1/23/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
class FavoriteOffersPresneter {
    
    private weak var view: FavoriteOffersView?
    private let favoriteOffersInteractor: FavoriteOffersInteractor
    private var favoriteOffer: Offer?
    private var favoriteOffers: [Offer]
    
    init(view: FavoriteOffersView) {
        self.view = view
        favoriteOffersInteractor = FavoriteOffersInteractor()
        favoriteOffers = [Offer]()
    }
    
    func viewDidLoad() {
        
        
        getFavoriteOffers(token:UserDefaults.standard.string(forKey: "token")!)
        
    }
    func  getFavoriteOffers(token: String)
    {
        view?.showIndicator()
        favoriteOffersInteractor.getUserFavorite(token: token) { [unowned self] (offers, error) in
            
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let offers = offers else { return }
                self.favoriteOffers = offers
                self.view?.getFavoriteOffersSuccess()
            }
        }
        
        
    }
    
    func getFavoriteOffersCount() -> Int {
        return favoriteOffers.count
    }
    func getFavoriteOfferID(index:Int)->String
    {
        return favoriteOffers[index].offerId ?? ""
    }
    func deleteFavoriteOfferFromArray(index: Int)  {
        favoriteOffers.remove(at: index)
    }
    func deleteFavoriteOffer(token:String,offer:String)  {
        favoriteOffersInteractor.deleteUserFavorite(token: token, offer: offer){
            [unowned self] (message, error) in
            
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard message != nil else { return }
                self.view?.offerDeletedSuccessfuly(message:message ?? "")
            }
            
        }
    }
    func configure(cell:
        FavoriteOffersCellView, for index: Int) {
        let favoriteOffer = self.favoriteOffers[index]
        
        guard let price = favoriteOffer.price
            ,let image = favoriteOffer.image,
            let title = favoriteOffer.title,
            let date = favoriteOffer.date
            else { return }
        cell.displayOfferPrice(price:price)
        cell.displayDate(dateText: date)
        cell.displayOfferImage(image: image)
        cell.displayOfferName(productName: title)
        
    }
    
    //    func pushToDetails(viewController : OffersDetailsViewController, _ index : Int) {
    //        viewController.offer = sells[index]
    //
    //    }
    
}
