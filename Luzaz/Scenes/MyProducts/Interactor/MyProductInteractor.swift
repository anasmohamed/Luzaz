//
//  MyProductInteractor.swift
//  Luzaz
//
//  Created by jets on 1/18/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class MyProductInteractor {
    func getUserSelling(countryId: String, userId : String,
                   completionHandler: @escaping ([Offer]?, Error?) -> Void) {
        Alamofire.request(LuzazRouter.getUserSelling(countryId:countryId,userId:userId )).responseJSON {(response) in
            
            if let response = response.data {
                print("Response Data: \(response)")
            } else {
                print("Response Data: nil")
            }
            if let request = response.request {
                print("Request Request: \(request)")
                print("Request Description: \(request.description)")
                print("Request Debug Description: \(request.debugDescription)")
                
                print("Response Request HTTP method: \(request.httpMethod!)")
                //                print("Response Request Content-Type: \(request.value(forHTTPHeaderField: NetworkingConstants.contentType)!)")
            } else {
                print("Response Request: nil")
            }
            
            if let responseStatusCode = response.response {
                print("Response Status Code: \(responseStatusCode.statusCode)")
            } else {
                print("Response Status Code: nil")
            }
            
            if let error = response.error {
                print("Response Error Code: \(error.localizedDescription)")
            } else {
                print("Response Error Code: nil")
            }
            
            
            let result = response.result
            switch result {
            case .success :
                let json = JSON(result.value!)
                print(json)
                var ordersList = [Offer]()
                let orders = json["data"].arrayValue
                for order in orders
                {
                    let data = Offer(withJSON: order)
                    ordersList.append(data)
                }
                completionHandler(ordersList, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
    }
    func getUserOrders(token: String,
                        completionHandler: @escaping ([Order]?, Error?) -> Void) {
        Alamofire.request(LuzazRouter.getUserOrders(token: token)).responseJSON {(response) in
            
            if let response = response.data {
                print("Response Data: \(response)")
            } else {
                print("Response Data: nil")
            }
            if let request = response.request {
                print("Request Request: \(request)")
                print("Request Description: \(request.description)")
                print("Request Debug Description: \(request.debugDescription)")
                
                print("Response Request HTTP method: \(request.httpMethod!)")
                //                print("Response Request Content-Type: \(request.value(forHTTPHeaderField: NetworkingConstants.contentType)!)")
            } else {
                print("Response Request: nil")
            }
            
            if let responseStatusCode = response.response {
                print("Response Status Code: \(responseStatusCode.statusCode)")
            } else {
                print("Response Status Code: nil")
            }
            
            if let error = response.error {
                print("Response Error Code: \(error.localizedDescription)")
            } else {
                print("Response Error Code: nil")
            }
            
            
            let result = response.result
            switch result {
            case .success :
                let json = JSON(result.value!)
                print(json)
                var ordersList = [Order]()
                let orders = json["data"].arrayValue
                for order in orders
                {
                    let data = Order(withJSON: order)
                    ordersList.append(data)
                }
                completionHandler(ordersList, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
    }
    func deleteOffer(token: String, offer : String,
                   completionHandler: @escaping (String?, Error?) -> Void) {
        Alamofire.request(LuzazRouter.deleteOffer(token: token, offer: offer)).responseJSON {(response) in
            
            if let response = response.data {
                print("Response Data: \(response)")
            } else {
                print("Response Data: nil")
            }
            if let request = response.request {
                print("Request Request: \(request)")
                print("Request Description: \(request.description)")
                print("Request Debug Description: \(request.debugDescription)")
                
                print("Response Request HTTP method: \(request.httpMethod!)")
                //                print("Response Request Content-Type: \(request.value(forHTTPHeaderField: NetworkingConstants.contentType)!)")
            } else {
                print("Response Request: nil")
            }
            
            if let responseStatusCode = response.response {
                print("Response Status Code: \(responseStatusCode.statusCode)")
            } else {
                print("Response Status Code: nil")
            }
            
            if let error = response.error {
                print("Response Error Code: \(error.localizedDescription)")
            } else {
                print("Response Error Code: nil")
            }
            
            
            let result = response.result
            switch result {
            case .success :
                let json = JSON(result.value!)
                print(json)
                let message = json["data"].stringValue
                
                completionHandler(message, nil)
            case .failure(let error):
                completionHandler("", error)
            }
            
        }
    }

}
