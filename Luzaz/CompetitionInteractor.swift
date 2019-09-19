//
//  CompetitionInteractor.swift
//  Luzaz
//
//  Created by jets on 1/19/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class CompetitionInteractor {
    func getCompetion(
                   completionHandler: @escaping ([Competation]?, Error?) -> Void) {
        Alamofire.request(LuzazRouter.getCompetition).responseJSON {(response) in
            
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
                var offersList = [Competation]()
                let offers = json["data"].arrayValue
                for offer in offers
                {
                    let data = Competation(withJSON: offer)
                    offersList.append(data)
                }
                completionHandler(offersList, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
    }

}
