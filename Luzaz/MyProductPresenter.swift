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
    private var order: Order?
    private var orders: [Order]
    init(view: MyProductView) {
        self.view = view
        myProductInteractor = MyProductInteractor()
        orders = [Order]()
    }
    
    func viewDidLoad() {
        
        //        getOffers(countryId:UserDefaults.standard.string(forKey: "country")!
        getOrders(token: "1")
        // )
    }
    
    func getOrders(token: String) {
        view?.showIndicator()
        myProductInteractor.getUserOrders(token: token) { [unowned self] (orders, error) in
            
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
      
        guard let quntity = order.quantity
            else { return }
        cell.displayProductQuntity(quntity: quntity)
        
    }
//    func pushToDetails(viewController : OffersDetailsViewController, _ index : Int) {
//        viewController.offer = offers[index]
//        
//    }
}
