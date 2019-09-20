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
    static let getCategories = "getCategories"
    static let getSubCategories = "getSubCategories"
    static let getConversationBuddies = "getConversationBuddies"
    static let getConversation = "getConversation"
    static let addToConversation = "addToConversation"
    static let addUserFavorites = "addUserFavorites"
    static let getUserOrders = "getUserOrders"
    static let getCompetition = "getCompetition"
    static let addCompetitionEnrolment = "addCompetitionEnrolment"


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
    static let offerId = "id"
    static let offerDate = "date"
    
    
    // User Requests
    static let update = "update"
    
    // User Query Parameters
    static let userId = "user_id"
    static let photo = "photo"
    static let fullName = "name"
    static let email = "email"
    static let phone = "phone"
    static let password = "password"
    static let rePassword = "re_password"
    static let countryId = "country_id"
    static let token = "token"
    static let countryNameArabic = "country_name_arabic"
    static let countryNameEnglish = "country_name_english"
    
    //GET MAIN CATEGORIES PARAMETER
    static let mainCategoriesId = "id"
    static let idCategory = "id_category"
    static let categoryName = "name"
    static let categorydescription = "description"
    static let categorykeywords = "keywords"
    static let categoryNameEng = "name_en"
    static let categoryDescriptionEng = "description_en"
    static let categoryKeywordsEng = "keywords_en"
    static let category = "category"
    static let subcategoryId = "subcategory"
    
    
    
    //Chat Parameter
    static let user = "user"
    static let buudyId = "id"
    static let buddyMail = "mail"
    
    //CONVERSATION PARAMETER
    static let conversationId = "id"
    static let sender = "sender"
    static let receiver = "receiver"
    static let date = "date"
    static let speech = "speech"
    static let attachmentsArray = "attachmentsArray"
    static let paging = "nopaging"
    
    //ADDTOCONVERSATION
    static let messangerId = "user"
    static let with = "with"
    static let senderSpeech = "speech"
    static let senderAttachmentsArray = "attachmentsArray"
    
    //ADDUSERFAVORITES
    static let favoriteUserToken = "Token"
    static let favoriteUserOffer = "offer"
    
    
    
    //GET USER ORDER
    static let userOrderToken = "Token"
    static let userOrderId = "id"
    static let getOrderUserId = "id_user"
    static let resellerId = "id_reseller"
    static let orderId = "order_id"
    static let offreId = "id_offer"
    static let userOrderPrice = "price"
    static let quantity = "quantity"
    static let totalPrice = "total_price"
    static let paymentWay = "payment_way"
    static let idAddress = "id_address"
    static let currency = "currency"
    
    
    //Competition Enrolment PARAMETER
    static let competitionId = "competition"
    static let competitionLang = "lang"
    static let questions = "questions"
    static let answers = "answers"
    static let competitionFirstName = "first_name"
    static let competitionLastName = "last_name"
    static let competitionPhone = "phone"
    static let competitionEmail = "email"

    
}

