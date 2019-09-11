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
            let result = response.result
            switch result {
            case .success :
                let json = JSON(result.value!)
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
