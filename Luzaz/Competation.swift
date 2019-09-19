//
//  Competation.swift
//  Luzaz
//
//  Created by jets on 1/19/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import SwiftyJSON
class Competation {
    
    var date: String?
    var questionsList = [Question]()
    var phone : String?
    var description : String?
    var image : String?
    var title : JSON?
    var enTitle : String?
    var arTitle : String?
    init(withJSON data: JSON) {
        self.date = data["date"].stringValue
        self.image = data["image"].stringValue
        self.title = data["title"]
        self.arTitle = title?["ar"].stringValue
        self.enTitle = title?["en"].stringValue
        let  questions = data["questions"].arrayValue
        for question  in questions
        {
            let  questionData = Question(withJson: question)
            questionsList.append(questionData)
        }
    }
}
