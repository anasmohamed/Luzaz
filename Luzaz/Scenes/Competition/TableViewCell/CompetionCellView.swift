//
//  CompetionCellView.swift
//  Luzaz
//
//  Created by jets on 1/19/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
protocol CompetionCellView :class{
    func displayQuestion(question: String,arQuestion:String)
    func displayFirstAnswer(firstAnswer : String)
    func displaySecondAnswer(secondAnswer : String)
    func displayThirdAnswer(thirdAnswer : String)

    
    
}
