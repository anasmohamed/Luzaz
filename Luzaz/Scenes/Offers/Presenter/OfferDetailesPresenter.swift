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
    private weak var productView : MyProductView?
    private let offersInteractor: OffersInteractor
    private let productInteractopr: MyProductInteractor
    private var sells: [Offer]?
    init(view: OfferDetailesView?) {
        self.view = view
        offersInteractor = OffersInteractor()
        productInteractopr = MyProductInteractor()
    }
    
    init(productView:MyProductView?) {
        self.productView = productView
        offersInteractor = OffersInteractor()
        productInteractopr = MyProductInteractor()
    }
    func getSellsCount() -> Int {
        guard let sellsCount = sells?.count else{
           return 0
        }
        return sellsCount
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
    func configure(cell: MyProductCellView, for index: Int) {
        let sell = sells![index]
         
         guard let quntity = sell.price
             ,let image = sell.image,
             let title = sell.title,
             let date = sell.date
             else { return }
         cell.displayProductQuntity(quntity: quntity)
         cell.displayDate(date: date)
         cell.displayProductImage(image: image)
         cell.displayProductName(productName: title)
         
     }
    func getMoreFromThisSeller(country:String,user:String)  {
       productView?.showIndicator()
        productInteractopr.getUserSelling(countryId:country , userId:user) { [unowned self] (sells, error) in
            
            self.productView?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let sells = sells else { return }
                self.sells = sells
                self.productView?.getMySellingProductsSuccess()
            }
        }
    }
   func pushToDetails(viewController : OffersDetailsViewController, _ index : Int) {
    viewController.offer = sells![index]
         
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
