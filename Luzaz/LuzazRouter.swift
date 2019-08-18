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
   
    
    var path: String {
        
        switch self {
        case .getOffers:
            return NetworkingConstants.getOffers
        
        }
    }
    
    var httpMethod: HTTPMethod {
        
        switch self {
        
        case .getOffers:
            return .get
        
        }
    }
    
    var httpHeaders: HTTPHeaders {
        
        var httpHeaders = [String:String]()
        
        switch self {
        case .getOffers:
            httpHeaders[NetworkingConstants.accept] = NetworkingConstants.contentTypeJSON
            httpHeaders[NetworkingConstants.contentType] = NetworkingConstants.contentTypeJSON
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
        case .getOffers:
            return try URLEncoding.methodDependent.encode(urlRequest, with: params)
//        case .register, .addBarber, .addService:
//            return try JSONEncoding.default.encode(urlRequest, with: body)
        }
    }
}
