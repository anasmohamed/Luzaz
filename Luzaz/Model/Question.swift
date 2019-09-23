//
//  Question.swift
//  Luzaz
//
//  Created by jets on 1/19/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//


import Foundation
import SwiftyJSON

class Question {
    var questionId : String?
    var question : String?
    var answersList = [Answer]()
    var enQuestions : [Question]?
    var arQuestions : [Question]?

    init() {
        
    }
    init(withJson data: JSON) {
        self.question = data["question"].stringValue
        self.questionId = data["id"].stringValue
        let answers =  data["answers"].arrayValue
         
        for answer in answers
        {
            let answerData = Answer(withJson: answer)
            answersList.append(answerData)
        }
    }
}
