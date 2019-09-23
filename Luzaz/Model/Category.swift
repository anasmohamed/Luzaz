//
//  Category.swift
//  Luzaz
//
//  Created by jets on 1/11/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import SwiftyJSON
class Category{
    var id : String?
    var id_category : String?
    var name : String?
    var description : String?
    var keywords : String?
    var nameEng : String?
    var descriptionEng : String?
    var keywordsEng : String?
    init() {
        
    }
    init(withJSON data: JSON) {
        
        self.id = data[NetworkingConstants.mainCategoriesId].stringValue
        self.id_category = data[NetworkingConstants.idCategory].stringValue
        self.name  = data[NetworkingConstants.categoryName].stringValue
        self.description  = data[NetworkingConstants.categorydescription].stringValue
        self.descriptionEng  = data[NetworkingConstants.categoryDescriptionEng].stringValue
        self.keywords  = data[NetworkingConstants.categorykeywords].stringValue
        self.nameEng  = data[NetworkingConstants.categoryNameEng].stringValue
        self.keywordsEng  = data[NetworkingConstants.categoryKeywordsEng].stringValue
      
    }
    

    
}
