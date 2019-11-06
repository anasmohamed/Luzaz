//
//  MyProductPresenter.swift
//  Luzaz
//
//  Created by jets on 1/18/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import UIKit
class MyProductPresenter {
    
    private weak var view: MyProductView?
    private let myProductInteractor: MyProductInteractor
    private var sell: Offer?
    private var sells: [Offer]
    private var orders: [Order]

    init(view: MyProductView) {
        self.view = view
        myProductInteractor = MyProductInteractor()
        sells = [Offer]()
        orders = [Order]()
    }
    
    func viewDidLoad() {
        
       
        getSells(countryId:UserDefaults.standard.string(forKey: "country")!, userId:UserDefaults.standard.string(forKey: "userId")!)
        
        getOrders(token: UserDefaults.standard.string(forKey: "token")!)
    
    }
    func getOrders(token: String)
    {
        view?.showIndicator()
        myProductInteractor.getUserOrders(token: token) { [unowned self] (orders, error) in
            
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let orders = orders else { return }
                self.orders = orders
                self.view?.getMyOrdersSuccess()
            }
        }

        
    }
    func getSells(countryId: String,userId:String) {
        view?.showIndicator()
        myProductInteractor.getUserSelling(countryId:countryId , userId:userId) { [unowned self] (sells, error) in
            
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let sells = sells else { return }
                self.sells = sells
                self.view?.getMySellingProductsSuccess()
            }
        }
    }
    func deleteOffer(token: String , offer: String)  {
        myProductInteractor.deleteOffer(token: token, offer: offer){
            [unowned self] (message, error) in
            
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard message != nil else { return }
                self.view?.offerDeletedSuccessfuly(message:message ?? "")
            }
            
        }
    }
    func getSellsCount() -> Int {
        return sells.count
    }
    func getOrdersCount() -> Int {
        return orders.count
    }
  
    func deleteItem(index:Int,selectedSegmentIndex:Int)
    {
        if selectedSegmentIndex == 0
        
        {
        sells.remove(at: index)
        }
        else
        {
            orders.remove(at: index)
        }
    }
    func configure(cell: MyProductCellView, for index: Int) {
        let sell = sells[index]
      
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
    func configure(cell: OrderCellView, for index: Int) {
        let order = orders[index]
        
        guard let price = order.price
            ,let totalPrice = order.total_price,
            let quntity = order.quantity
            
            else { return }
        cell.displayProductPrice(price: price)
//        cell.displayDate(date: date)
        cell.displayProductTotalPrice(productTotalPrice:totalPrice )
        cell.displayProductQuntity(quntity: quntity)
        
    }
    func getOfferCity(index:Int) -> String
    {
        return sells[index].governorate!
    }
    func getOfferId(index: Int,segmentControlIndex : Int) -> String{
        if segmentControlIndex == 0
        {
            return sells[index].offerId ?? ""
        }else{
            return orders[index].offreId ?? ""

        }
    }
    func pushToDetails(viewController : OffersDetailsViewController, _ index : Int) {
        viewController.offer = sells[index]
        
    }
}
