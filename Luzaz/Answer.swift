//
//  Answer.swift
//  Luzaz
//
//  Created by jets on 1/19/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import SwiftyJSON

class Answer {
    var answerId : String?
    var answer : String?
    init() {
        
    }
    init(withJson data: JSON) {
        self.answer = data["answer"].stringValue
        self.answerId = data["id"].stringValue
    }
}
