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
    var competitionId : String?
    var date: String?
    var questions : JSON?
    var phone : String?
    var description : String?
    var image : String?
    var title : JSON?
    var enTitle : String?
    var arTitle : String?
    var enQuestions : [JSON]?
    var arQuestions: [JSON]?
    var enQuestionsList: [Question]
    var arQuestionsList : [Question]

    init(withJSON data: JSON) {
        self.competitionId = data["id"].stringValue
        self.date = data["date"].stringValue
        self.image = data["image"].stringValue
        self.title = data["title"]
        self.arTitle = title?["ar"].stringValue
        self.enTitle = title?["en"].stringValue
        self.questions = data["questions"]
        self.enQuestions = questions?["en"].arrayValue
        self.arQuestions = questions?["ar"].arrayValue
        
        self.enQuestionsList = [Question]()
        self.arQuestionsList = [Question]()

        for question in enQuestions!
        {
            let questionData = Question(withJson: question)
            enQuestionsList.append(questionData)
        }
        for question in arQuestions!
        {
            let questionData = Question(withJson: question)
            arQuestionsList.append(questionData)
        }
        
    }
}
