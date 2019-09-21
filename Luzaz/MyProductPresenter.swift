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
    private var order: Offer?
    private var orders: [Offer]
    init(view: MyProductView) {
        self.view = view
        myProductInteractor = MyProductInteractor()
        orders = [Offer]()
    }
    
    func viewDidLoad() {
        
        //        getOffers(countryId:UserDefaults.standard.string(forKey: "country")!
        getOrders(countryId:UserDefaults.standard.string(forKey: "country")!, userId:UserDefaults.standard.string(forKey: "userId")!)
        // )
    }
    
    func getOrders(countryId: String,userId:String) {
        view?.showIndicator()
        myProductInteractor.getUserOrders(countryId:countryId , userId:userId) { [unowned self] (orders, error) in
            
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let orders = orders else { return }
                self.orders = orders
                self.view?.getMySellingProductsSuccess()
            }
        }
    }
    func getOrderCount() -> Int {
        return orders.count
    }

    
    func configure(cell: MyProductCellView, for index: Int) {
        let order = orders[index]
      
        guard let quntity = order.price
            ,let image = order.image,
            let title = order.title,
        let date = order.date
            else { return }
        cell.displayProductQuntity(quntity: quntity)
        cell.displayDate(date: date)
        cell.displayProductImage(image: image)
        cell.displayProductName(productName: title)
        
    }
    func pushToDetails(viewController : OffersDetailsViewController, _ index : Int) {
        viewController.offer = orders[index]
        
    }
}
