//
//  CompetitionView.swift
//  Luzaz
//
//  Created by jets on 1/19/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
protocol CompetitionView:class {
    func showIndicator()
    func hideIndicator()
    func getCompetitionSuccess()
    func showError(error: String,content: String,code :String)
    func displayFirstOption(firstOption: String)
    func displaySecondOption(secondOption: String)
    func displayThreeOption(threeOption: String)
    func displayQuestion(question: String,arQuesetion:String)

    
}
