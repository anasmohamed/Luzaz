//
//  LuzazRouter.swift
//  Luzaz
//
//  Created by jets on 12/15/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import Alamofire

enum LuzazRouter: URLRequestConvertible {
    
    
    case getOffers(country:String)
    case login(email: String, password: String)
    case register(user: User)
    case getMainCategories()
    case getSubCategories(mainCategoryId: String)
    case getConversationBuddies(userId : String)
    case getConversation(id: String,paging:String)
    case addToConversation(user :String ,with : String, speech: String)
    case getSubCategoryOffers(mainCategoryId : String)
    case addUserFavorites(token : String, offerId : String)
    case getUserSelling(countryId : String,userId : String)
    case getCompetition
    case addCompetitionEnrolment(id : String,lang :String,questions : String,answers : String,firstName : String ,lastName:String,phone :String,email :String)
    case getUserOrders(token : String)
    case logoutUser(user : String)
    case getUserFavorites(token : String)
    case setPasswordByToken(token:String,password : String,rePassword:String)
    var path: String {
        
        switch self {
        case .getOffers:
            return NetworkingConstants.getOffers
        case .login:
            return NetworkingConstants.login
        case .register:
            return NetworkingConstants.register
        case .getMainCategories:
            return  NetworkingConstants.getCategories
        case .getSubCategories:
            return NetworkingConstants.getSubCategories
        case .getConversationBuddies:
            return NetworkingConstants.getConversationBuddies
        case .getConversation:
            return NetworkingConstants.getConversation
        case .addToConversation:
            return NetworkingConstants.addToConversation
        case .getSubCategoryOffers:
            return NetworkingConstants.getOffers
        case .addUserFavorites:
            return NetworkingConstants.addUserFavorites
        case .getUserSelling:
            return NetworkingConstants.getUserSelling
        case .getCompetition:
            return NetworkingConstants.getCompetition
        case .addCompetitionEnrolment:
            return NetworkingConstants.addCompetitionEnrolment
        case .getUserOrders:
            return NetworkingConstants.getUserOrders
        case .getUserFavorites:
            return NetworkingConstants.getUserFavorites
        case .logoutUser:
            return NetworkingConstants.logoutUser
        case .setPasswordByToken:
            return NetworkingConstants.setPasswordByToken
        }
    }
    
    var httpMethod: HTTPMethod {
        
        switch self {
        case .getOffers,.login,.getMainCategories,.getSubCategories,.getConversationBuddies,.getConversation,.getSubCategoryOffers,.addUserFavorites,.getUserSelling,.getCompetition,.addCompetitionEnrolment,.getUserOrders,.getUserFavorites,.logoutUser,.setPasswordByToken:
            return .get
        case .register,.addToConversation:
            return .post
            
        }
    }
    
    var httpHeaders: HTTPHeaders {
        
        let httpHeaders = [String:String]()
        
        switch self {
            //        case .getOffers:
            //            httpHeaders[NetworkingConstants.accept] = NetworkingConstants.contentTypeJSON
        //            httpHeaders[NetworkingConstants.contentType] = NetworkingConstants.contentTypeJSON
        default:
            print("Empty request headers")
        }
        
        return httpHeaders
    }
    
    var body: [String: Any] {
        
        let body = [String:Any]()
        
        switch self {
            
            
        default:
            print("Empty request body")
        }
        
        return body
    }
    
    var params: [String: Any] {
        
        var params = [String:Any]()
        
        switch self {
        case let .getOffers(country):
            params[NetworkingConstants.country] = country
        case let .register(user):
            params[NetworkingConstants.countryId] = user.countryId
            params[NetworkingConstants.fullName] = user.fullName
            params[NetworkingConstants.phone] = user.phoneNumber
            params[NetworkingConstants.email] = user.email
            params[NetworkingConstants.password] = user.password
            params[NetworkingConstants.rePassword] = user.rePassword
        case let .login(email,password):
            params[NetworkingConstants.email] = email
            params[NetworkingConstants.password] = password
        case let .getSubCategories(mainCategoryid):
            params[NetworkingConstants.category] = mainCategoryid
            
        case let .getConversationBuddies(userId):
            params[NetworkingConstants.user] = userId
        case let .getConversation(id,nopaging):
            params[NetworkingConstants.conversationId] = id
            params[NetworkingConstants.paging] = nopaging
            
        case let .addToConversation(user ,with, speech):
            params[NetworkingConstants.messangerId] = user
            params[NetworkingConstants.with] = with
            params[NetworkingConstants.senderSpeech] = speech
        case let .getSubCategoryOffers(mainCategoryId):
            params[NetworkingConstants.mainCategoriesId] = mainCategoryId
        case let .addUserFavorites(token,offerId):
            params[NetworkingConstants.favoriteUserToken] = token
            params[NetworkingConstants.favoriteUserOffer] = offerId
        case let .getUserSelling(countryId,userId):
            params[NetworkingConstants.countryId] = countryId
            params[NetworkingConstants.userId] = userId
            
        case let .addCompetitionEnrolment(id ,lang ,questions ,answers ,firstName  ,lastName,phone ,email):
            params[NetworkingConstants.competitionId] = id
            params[NetworkingConstants.competitionLang] = lang
            
            params[NetworkingConstants.questions] = questions
            params[NetworkingConstants.answers] = answers
            params[NetworkingConstants.competitionFirstName] = firstName
            params[NetworkingConstants.competitionLastName] = lastName
            params[NetworkingConstants.phone] = phone
            params[NetworkingConstants.email] = email
        case let .getUserOrders(token):
            params[NetworkingConstants.token] = token
            
        case let .getUserFavorites(token):
            params[NetworkingConstants.token] = token
        case let  .logoutUser(user):
            params[NetworkingConstants.logoutUserParameter] = user
        case let .setPasswordByToken(token, password, rePassword):
            params[NetworkingConstants.changePasswordToken] = token
            params[NetworkingConstants.changePasswordNewPassword] = password
            params[NetworkingConstants.changePasswordConPassword] = rePassword
        default:
            print("Empty Paramter")
            
        }
        
        return params
    }
    
    func asURLRequest() throws -> URLRequest {
        let baseURL = try NetworkingConstants.baseURL.asURL()
        
        // URL Request Components
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = httpHeaders
        
        switch self {
        case .getOffers,.register,.login,.getMainCategories,.getSubCategories,.getConversationBuddies,.getConversation,.addToConversation,.getSubCategoryOffers,.addUserFavorites,.getUserSelling,.getCompetition,.addCompetitionEnrolment,.getUserOrders,.getUserFavorites,.logoutUser,.setPasswordByToken:
            
            return try URLEncoding.methodDependent.encode(urlRequest, with: params)
            
            //        case .register, .addBarber, .addService:
            //            return try JSONEncoding.default.encode(urlRequest, with: body)
            
        }
    }
}
