//
//  Order.swift
//  Luzaz
//
//  Created by jets on 1/18/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import SwiftyJSON
class Order {
    var id : String?
    var userId: String?
    var resellerId: String?
    var orderId :String?
    var offreId :String?
    var price : String?
    var quantity :String?
    var total_price : String?
    var paymentWay : String?
    var idAddress : String?
    var currency: String?
    init() {
        
    }
    init(withJSON data: JSON) {
        self.id = data[NetworkingConstants.userOrderId].stringValue
        self.price = data[NetworkingConstants.userOrderPrice].stringValue
        self.paymentWay = data[NetworkingConstants.paymentWay].stringValue
        self.quantity = data[NetworkingConstants.quantity].stringValue
        self.total_price = data[NetworkingConstants.totalPrice].stringValue
        self.currency = data[NetworkingConstants.idAddress].stringValue
        self.orderId = data[NetworkingConstants.orderId].stringValue
        var resellerId = data[NetworkingConstants.resellerId].stringValue
        
    }
}
