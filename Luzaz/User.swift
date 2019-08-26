//
//  User.swift
//  Luzaz
//
//  Created by jets on 12/23/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import SwiftyJSON
class User{
    var fullName : String?
    var phoneNumber : String?
    var mail : String?
    var password : String?
    var rePassword : String?
    var countryId : String?
    var userId : String?
    var token : String?
    var countryEnglishName : String?
    var countryArabicName : String?
    init()
    {}
    init(withJSON data: JSON) {
        self.userId = data[NetworkingConstants.userId].stringValue
        self.token = data[NetworkingConstants.token].stringValue
        self.countryId  = data[NetworkingConstants.countryId].stringValue
        self.countryEnglishName = data[NetworkingConstants.countryNameEnglish].stringValue
        self.countryArabicName = data[NetworkingConstants.countryNameArabic].stringValue
    }
    
    
    
    
}
