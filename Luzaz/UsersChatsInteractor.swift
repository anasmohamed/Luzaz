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
        Alamofire.request(LuzazRouter.getOffers(country: userId)).responseJSON {(response) in
            let result = response.result
            switch result {
            case .success :
                let json = JSON(result.value!)
                var usersChatsList = [User]()
                let offers = json["data"].arrayValue
                for offer in offers
                {
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
