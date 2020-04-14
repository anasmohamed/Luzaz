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
        completionHandler: @escaping ([Question]?,[Question]?,String?, String,Error?) -> Void) {
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
                var competationList = [Competation]()
                let competation = json
                let data = Competation(withJSON: competation)
                competationList.append(data)
                
                completionHandler(competationList[0].enQuestionsList,competationList[0].arQuestionsList,data.competitionId!,data.image! ,nil)
            case .failure(let error):
                completionHandler(nil,nil,nil, "",error)
            }
            
        }
    }
    func addCompetitionEnrolment(id:String , lang: String, questions: String, answers: String, firstName: String, lastName: String, phone: String, email: String,
        completionHandler: @escaping (String?,String?, Error?) -> Void) {
        Alamofire.request(LuzazRouter.addCompetitionEnrolment(id:id , lang: lang, questions: questions,answers:answers , firstName: firstName,lastName:lastName, phone: phone, email: email)).responseJSON {(response) in
            
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
                //                let competation = json
//                let data = Competation(withJSON: competation)
//                competationList.append(data)
let description = json["description"].stringValue
                let code = json["code"].stringValue
                completionHandler(description ,code, nil)
            case .failure(let error):
                completionHandler(nil,nil, error)
            }
            
        }
    }
}
