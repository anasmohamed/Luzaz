//
//  Brands.swift
//  Luzaz
//
//  Created by jets on 1/29/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import SwiftyJSON
class  Brands{
    var name : String?
    var id  :String?
    init(withJson data : JSON) {
        self.name = data["name"].stringValue
        self.id = data["id"].stringValue
    }
    init() {
        
    }
}
