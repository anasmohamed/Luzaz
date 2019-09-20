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
    func showError(error: String)
    func answerSuccess()
    
}
