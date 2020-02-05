//
//  OffersInteractor.swift
//  Luzaz
//
//  Created by jets on 12/16/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class OffersInteractor {
    
    
    func getOffers(countryId: String,page:String,
                   completionHandler: @escaping ([Offer]?, Error?) -> Void) {
        Alamofire.request(LuzazRouter.getOffers(country: countryId,page:page)).responseJSON {(response) in
            
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
                var offersList = [Offer]()
                let offers = json["data"].arrayValue
                if json["data"] != "null" {
                    for offer in offers
                    {
                        let data = Offer(withJSON: offer)
                        offersList.append(data)
                        
                    }
                    completionHandler(offersList, nil)
                    
                }else{
                    let sessionManager = Alamofire.SessionManager.default
                    sessionManager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in dataTasks.forEach { $0.cancel()
                        
                        }
                        uploadTasks.forEach { $0.cancel() }
                        downloadTasks.forEach { $0.cancel() }
                        
                    }
                }
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
    }
    func getMoreFromThisSeller(id : String,completionHandler :@escaping ([Offer]?, Error?) -> Void)  {
        Alamofire.request(LuzazRouter.getMoreFromThisSeller(country: id)).responseJSON {(response) in
            
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
                var offersList = [Offer]()
                let offers = json["data"].arrayValue
                for offer in offers
                {
                    let data = Offer(withJSON: offer)
                    offersList.append(data)
                }
                completionHandler(offersList, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
    }
    func addReportOffre(offer:String,title:String,message:String,email:String,completionHandler: @escaping (String?, Error?) -> Void){
        Alamofire.request(LuzazRouter.addReportOffer(offer: offer, title: title, message: message, email: email)).responseJSON {(response) in
            
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
                let message = json["data"].stringValue
                print(json)
                print(message)
                completionHandler(message, nil)
            case .failure(let error):
                completionHandler("", error)
            }
            
        }
    }
    func addProductToFavorite(token : String,offerId : String,completionHandler: @escaping (String?, Error?) -> Void) {
        Alamofire.request(LuzazRouter.addUserFavorites(token: token, offerId: offerId)).responseJSON {(response) in
            
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
                let message = json["data"].stringValue
                print(json)
                print(message)
                completionHandler(message, nil)
            case .failure(let error):
                completionHandler("", error)
            }
            
        }
    }
    
    
}
