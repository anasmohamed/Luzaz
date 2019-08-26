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
    
    var path: String {
        
        switch self {
        case .getOffers:
            return NetworkingConstants.getOffers
        case .login:
            return NetworkingConstants.login
        case .register:
            return NetworkingConstants.register
        }
    }
    
    var httpMethod: HTTPMethod {
        
        switch self {
        
        case .getOffers:
            return .get
        case .register:
            return .post
        default :
            return .get
        }
    }
    
    var httpHeaders: HTTPHeaders {
        
        var httpHeaders = [String:String]()
        
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
        
        var body = [String:Any]()
        
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
            params[NetworkingConstants.email] = user.mail
            params[NetworkingConstants.password] = user.password
            params[NetworkingConstants.rePassword] = user.rePassword
        default:
            print("Empty request params")
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
        case .getOffers,.register:
            return try URLEncoding.methodDependent.encode(urlRequest, with: params)
//        case .register, .addBarber, .addService:
//            return try JSONEncoding.default.encode(urlRequest, with: body)
        default :
            return  try URLEncoding.methodDependent.encode(urlRequest, with: params)
        }
    }
}
