//
//  OffersInteractor.swift
//  Luzaz
//
//  Created by jets on 12/16/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class OffersInteractor {
    
    
    func getOffers(countryId: String,
                   completionHandler: @escaping ([Offer]?, Error?) -> Void) {
        Alamofire.request(LuzazRouter.getOffers(country: countryId)).responseJSON {(response) in
            let result = response.result
            switch result {
            case .success :
                let json = JSON(result.value!)
                var offersList = [Offer]()
                let offers = json["data"].arrayValue
                for offer in offers
                {
                    let data = Offer(withJSON: offer)
                    offersList.append(data)
                }
                completionHandler(offersList, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
    }
    
}
