//
//  UsersChatsInteractor.swift
//  Luzaz
//
//  Created by jets on 1/10/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON

class UsersChatsInteractor {
    
    
    func getUsersChats(userId: String,
                   completionHandler: @escaping ([User]?, Error?) -> Void) {
        Alamofire.request(LuzazRouter.getConversationBuddies(userId: userId)).responseJSON {(response) in
            let result = response.result
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
            switch result {
            case .success :
                let json = JSON(result.value!)
                print(json)
                var usersChatsList = [User]()
                let offers = json["data"].arrayValue
                for offer in offers
                {
                    print("buddies\(offer)")
                    let data = User(withJSON: offer)
                    usersChatsList.append(data)
                }
                completionHandler(usersChatsList, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
    }
    
}
