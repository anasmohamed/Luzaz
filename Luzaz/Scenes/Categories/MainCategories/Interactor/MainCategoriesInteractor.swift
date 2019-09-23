//
//  MainCategoriesInteractor.swift
//  Luzaz
//
//  Created by jets on 1/11/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class MainCategoriesInteractor {
    func getMainCategories(
                   completionHandler: @escaping ([Category]?, Error?) -> Void) {
        Alamofire.request(LuzazRouter.getMainCategories()).responseJSON {(response) in
            
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
                var categorieslist = [Category]()
                let categories = json["data"].arrayValue
                for category in categories
                {
                    let data = Category(withJSON: category)
                    categorieslist.append(data)
                }
                completionHandler(categorieslist, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
    }
    
}
