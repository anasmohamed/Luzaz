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
    init()
    {}
    init(withJSON data: JSON) {
        
        self.fullName = data[NetworkingConstants.fullName].stringValue
        self.phoneNumber = data[NetworkingConstants.phone].stringValue
        self.mail  = data[NetworkingConstants.email].stringValue
        self.password  = data[NetworkingConstants.password].stringValue
        self.rePassword  = data[NetworkingConstants.rePassword].stringValue
        self.countryId  = data[NetworkingConstants.countryId].stringValue
        
    }
    
    
    
    
}
