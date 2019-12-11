//
//  ChangePasswordInteractor.swift
//  Luzaz
//
//  Created by jets on 1/25/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
class ChangePasswordInteractor {
    func setPasswordByToken(token: String,password : String,rePassword : String,
                         completionHandler: @escaping (String?, Error?) -> Void) {
        Alamofire.request(LuzazRouter.setPasswordByToken(token: token,password : password,rePassword: rePassword)).responseJSON {(response) in
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
                let message = json["data"].stringValue
              
                completionHandler(message, nil)
            case .failure(let error):
                completionHandler("", error)
            }
            
        }
    }
    func forgetPassword(email: String,
                         completionHandler: @escaping (String?, Error?) -> Void) {
        Alamofire.request(LuzazRouter.getResetPasswordTokenByEmail(email: email)).responseJSON {(response) in
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
                let message = json["data"].stringValue
                completionHandler(message, nil)
            case .failure(let error):
                completionHandler("", error)
            }
            
        }
    }
}
