//
//  User.swift
//  Luzaz
//
//  Created by jets on 12/23/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import SwiftyJSON
class User :NSObject,NSCoding{
    var fullName : String?
    var phoneNumber : String?
    var email : String?
    var password : String?
    var rePassword : String?
    var countryId : String?
    var userId : String?
    var token : String?
    var countryEnglishName : String?
    var countryArabicName : String?
    var image : String?
    var buddyId : String?
    var buddyMail : String?
    override init()
    {}
    init(withJSON data: JSON) {
        self.userId = data[NetworkingConstants.user].stringValue
        self.token = data[NetworkingConstants.token].stringValue
        self.countryId  = data[NetworkingConstants.countryId].stringValue
        self.countryEnglishName = data[NetworkingConstants.countryNameEnglish].stringValue
        self.countryArabicName = data[NetworkingConstants.countryNameArabic].stringValue
        self.image = data[NetworkingConstants.photo].stringValue
        self.fullName = data[NetworkingConstants.fullName].stringValue
        self.buddyId = data[NetworkingConstants.buudyId].stringValue
        self.buddyMail = data[NetworkingConstants.buddyMail].stringValue
        self.phoneNumber = data[NetworkingConstants.phone].stringValue
    }
    
    init(userId: String?, fullName: String?, email: String?, password: String?,token : String,phone: String) {
        self.userId = userId
        self.fullName = fullName
        self.email = email
        self.password = password
        self.token = token
        self.phoneNumber = phone
    }
    required convenience init(coder aDecoder: NSCoder) {
        let userId = aDecoder.decodeObject(forKey: "userId") as! String?
        let fullName = aDecoder.decodeObject(forKey: "fullName") as! String?

        let email = aDecoder.decodeObject(forKey: "email") as! String?
        let password = aDecoder.decodeObject(forKey: "password") as! String?
        let token = aDecoder.decodeObject(forKey: "token") as! String?
        let phone = aDecoder.decodeObject(forKey: "phone") as! String?

            self.init(userId: userId, fullName: fullName, email: email, password: password,token: token!,phone: phone!)
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(userId, forKey: "userId")
        aCoder.encode(fullName, forKey: "fullName")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(password, forKey: "password")
        aCoder.encode(token,forKey:"token")
        aCoder.encode(token,forKey:"phone")
    }
    
    
}
