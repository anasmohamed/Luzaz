//
//  ConsersationInteractor.swift
//  Luzaz
//
//  Created by jets on 1/14/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class ConsersationInteractor {
    func getConversation(id: String,paging : String,
                   completionHandler: @escaping ([Conversation]?, Error?) -> Void) {
        Alamofire.request(LuzazRouter.getConversation(id: id, paging: paging)).responseJSON {(response) in
            let result = response.result
            switch result {
            case .success :
                let json = JSON(result.value!)
                var conversationsList = [Conversation]()
                let conversations = json["data"].arrayValue
                for conversation in conversations
                {
                    let data = Conversation(withJSON: conversation)
                    conversationsList.append(data)
                }
                completionHandler(conversationsList, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
    }

}
