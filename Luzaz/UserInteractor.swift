//
//  UserInteractor.swift
//  Luzaz
//
//  Created by jets on 12/23/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

class UserInteractor {
    
    func login(email: String,
               password: String,
               completionHandler: @escaping (User?, Error?) -> Void) {
        
        Alamofire.request(LuzazRouter.login(email: email, password: password)).responseJSON {
            (response) in
            let result = response.result
            switch result {
            case .success:
                let json = JSON(result.value)
                print(json)
                let jsonUser = json["data"].object as! User
                if json["code"].stringValue == "0" {
                    completionHandler(nil, nil)
                } else {
                    completionHandler(jsonUser, nil)
                }
                
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    //
    func register(user: User,
                  completionHandler: @escaping (Error?) -> Void) {
        
        Alamofire.request(LuzazRouter.register(user: user)).responseJSON {
            (response: DataResponse<Any>) in
            let result = response.result
            print(result)
            switch result {
            case .success:
                completionHandler(nil)
            case .failure(let error):
                completionHandler(error)
            }
        }
    }
    
    
}
