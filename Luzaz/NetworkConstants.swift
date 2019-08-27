//
//  NetworkConstants.swift
//  Luzaz
//
//  Created by jets on 12/15/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

//
//  NetworkingConstants.swift
//  Instalook
//
//  Created by Amer Shaker on 6/3/19.
//  Copyright © 2019 instalook. All rights reserved.
//

import Foundation

struct NetworkingConstants {
    
    static let baseURL = "http://api.luzaz.com/ar/mobile/"
    
    // Request Headers
    static let contentType = "Content-Type"
    static let accept = "Accept"
    static let contentTypeJSON = "application/json"
    
    
    static let getOffers = "getOffers"
    static let register = "register"
    static let login = "login"
    
    
    //get offers pramters
    static let country = "country"
    static let nopaging = "nopaging"
    static let title = "title"
    static let description = "description"
    static let price = "price"
    static let discount_prec = "discount_prec"
    static let price_after_discount = "price_after_discount"
    static let image = "image"
    static let reseller_name = "reseller_name"
    
    // User Requests
    static let update = "update"
    
    // User Query Parameters
    static let userId = "user_id"
    static let fullName = "name"
    static let email = "email"
    static let phone = "phone"
    static let password = "password"
    static let rePassword = "re_password"
    static let countryId = "country_id"
    static let token = "token"
    static let countryNameArabic = "country_name_arabic"
    static let countryNameEnglish = "country_name_english"
    
}

