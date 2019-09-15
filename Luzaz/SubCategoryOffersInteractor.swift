//
//  SubCategoryOffers.swift
//  Luzaz
//
//  Created by jets on 1/16/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class SubCategoryOffersInteractor {
    func getSubCategoryOffers(countryId: String,subcategoryId : String,
                   completionHandler: @escaping ([Offer]?, Error?) -> Void) {
        Alamofire.request(LuzazRouter.getSubCategoryOffers(countryId: countryId,subCategoryId : subcategoryId)).responseJSON {(response) in
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
