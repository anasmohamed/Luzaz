//
//  OffersInteractor.swift
//  Luzaz
//
//  Created by jets on 12/16/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class BarberInteractor {
  
    
    func getOffers(countryId: String,
                       completionHandler: @escaping ([Offer]?, Error?) -> Void) {
        
        Alamofire.request(LuzazRouter.getOffers(country: countryId)).responseArray {
            (response: DataResponse<[Offer]>) in
            let result = response.result
            switch result {
            case .success(let offers):
                completionHandler(offers, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
 
}
