//
//  UserInteractor.swift
//  Luzaz
//
//  Created by jets on 12/23/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserInteractor {
    
    func login(email: String,
               password: String,
               completionHandler: @escaping (User?, Error?) -> Void) {
        
        Alamofire.request(LuzazRouter.login(email: email, password: password)).responseJSON {
            (response) in
            
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
            case .success:
                let json = JSON(result.value)
                print(json)
                
                if json["code"].stringValue == "1" {
                    completionHandler(nil, nil)
                } else {
                    let jsonUser = json["data"].object
                print(jsonUser)
                    let user = User(withJSON: JSON(jsonUser))
                    completionHandler(user, nil)
                }
                
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    //
    func register(user: User,
                  completionHandler: @escaping (String?,Error?) -> Void) {
        
        Alamofire.request(LuzazRouter.register(user: user)).responseJSON {
            (response) in
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
            print(result)
            
            switch result {
            case .success:
                let json = JSON(result.value)
                print(json)
                
                if json["code"].stringValue == "1" {
                    completionHandler(nil, nil)
                } else {
                    let jsonUser = json["data"].object
                    print(jsonUser)}
                completionHandler("",nil)
            case .failure(let error):
                completionHandler("",error)
            }
        }
    }
    func getUser(id: String,
                     completionHandler: @escaping (String?,Error?) -> Void) {
           
           Alamofire.request(LuzazRouter.getUser(id: id)).responseJSON {
               (response) in
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
               print(result)
               
               switch result {
               case .success:
                   let json = JSON(result.value)
                   print(json)
                   
                   if json["code"].stringValue == "1" {
                       completionHandler(nil, nil)
                   } else {
                       let jsonUser = json["data"].object
                       print(jsonUser)}
                   completionHandler("",nil)
               case .failure(let error):
                   completionHandler("",error)
               }
           }
       }
       
    
}
