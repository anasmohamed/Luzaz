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

class UserInteractor {
    
//    func login(email: String,
//               password: String,
//               completionHandler: @escaping (User?, Error?) -> Void) {
//        
//        Alamofire.request(InstalookRouter.login(email: email, password: password)).responseObject {
//            (response: DataResponse<User>) in
//            let result = response.result
//            switch result {
//            case .success(let user):
//                if let statusCode = response.response?.statusCode {
//                    if statusCode == 404 {
//                        completionHandler(nil, nil)
//                    } else {
//                        completionHandler(user, nil)
//                    }
//                }
//            case .failure(let error):
//                completionHandler(nil, error)
//            }
//        }
//    }
//    
    func register(user: User,
                  completionHandler: @escaping (Error?) -> Void) {
        
        Alamofire.request(LuzazRouter.register(user: user)).responseJSON {
            (response: DataResponse<Any>) in
            let result = response.result
            switch result {
            case .success:
                completionHandler(nil)
            case .failure(let error):
                completionHandler(error)
            }
        }
    }
    
  
}
