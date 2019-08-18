//
//  Product.swift
//  Luzaz
//
//  Created by jets on 12/16/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import ObjectMapper

class Offer: Mappable {
    
    var title: String?
    var description: String?
    var price: String?
    var discount_prec: String?
    var price_after_discount: String?
    var image : String?
    var reseller_name : String?
    
    init() {
        
    }
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map[NetworkingConstants.title]
        description <- map[NetworkingConstants.description]
        price <- map[NetworkingConstants.price]
        discount_prec <- map[NetworkingConstants.discount_prec]
        price_after_discount <- map[NetworkingConstants.price_after_discount]
        image <- map[NetworkingConstants.image]
        reseller_name <- map[NetworkingConstants.reseller_name]
        
    }
}
