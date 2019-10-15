//
//  CategoryAttributes.swift
//  Luzaz
//
//  Created by Anas Mohamed on 10/14/19.
//  Copyright © 2019 Luzaz. All rights reserved.
//

import Foundation
import SwiftyJSON

class CategoryAttributes {
    var attributeId : String?
    var name_en : String?
    var name : String?
    init() {
        
    }
    init(withJson data: JSON) {
        self.attributeId = data["id"].stringValue
        self.name_en = data["name_en"].stringValue
        self.name = data["name"].stringValue

    }
}
