//
//  Product.swift
//  Luzaz
//
//  Created by jets on 12/16/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import SwiftyJSON

class Offer {
    var offerId: String?
    var title: String?
    var description: String?
    var price: String?
    var discount_prec: String?
    var price_after_discount: String?
    var image : String?
    var reseller_name : String?
    var city : String?
    var itemImages : [UIImage]?
    var category : String?
    var subCateogry : String?
    var brand : String?
    var condition : String?
    var date : String?
    var reseller_mail : String?
    var reseller_phone : String?
    var reseller_id : String?
    var offerImage : UIImage?
    var contactType : String?
    var governorate : String?
    var album = [ImagesAlbum]()
    var appartment = Appartment()
    init(withJSON data: JSON) {
        self.offerId = data[NetworkingConstants.offerId].stringValue
        self.title = data[NetworkingConstants.title].stringValue
        self.description = data[NetworkingConstants.description].stringValue
        self.price  = data[NetworkingConstants.price].stringValue
        self.discount_prec  = data[NetworkingConstants.discount_prec].stringValue
        self.price_after_discount  = data[NetworkingConstants.price_after_discount].stringValue
        self.image  = data[NetworkingConstants.image].stringValue
        
        self.reseller_name  = data[NetworkingConstants.reseller_name].stringValue
        self.date = data[NetworkingConstants.offerDate].stringValue
        self.reseller_phone = data[NetworkingConstants.reseller_phone].stringValue
        self.reseller_mail = data[NetworkingConstants.reseller_mail].stringValue
        self.reseller_id = data[NetworkingConstants.reseller_id].stringValue
        self.contactType = data[NetworkingConstants.contentType].stringValue
        self.governorate = data["governorate"].stringValue
        let incomeAlbum = data["album"].arrayValue
         
        for image in incomeAlbum
        {
            let imageData = ImagesAlbum(withJson: image)
            self.album.append(imageData)
        }
    }
    
    init() {
        
    }
//    required init(map: Map) {
//        
//    }
    
//    func mapping(map: Map) {
//        title <- map[NetworkingConstants.title]
//        description <- map[NetworkingConstants.description]
//        price <- map[NetworkingConstants.price]
//        discount_prec <- map[NetworkingConstants.discount_prec]
//        price_after_discount <- map[NetworkingConstants.price_after_discount]
//        image <- map[NetworkingConstants.image]
//        reseller_name <- map[NetworkingConstants.reseller_name]
//        
//    }
}
