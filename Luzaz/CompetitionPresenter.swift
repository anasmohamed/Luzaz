//
//  CompetitionPresenter.swift
//  Luzaz
//
//  Created by jets on 1/19/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
class CompetitionPresenter {
    private weak var view: CompetitionView?
    private let competitionInteractor: CompetitionInteractor
    private var offer: Offer?
    private var competations: [Competation]
    
    private var qustions : [Question]
    init(view: CompetitionView) {
        self.view = view
        competitionInteractor = CompetitionInteractor()
        competations = [Competation]()
        qustions =  [Question]()
    }
    
    func viewDidLoad() {
        
        
        getQuestions()
        
    }
    
    func getQuestions() {
        view?.showIndicator()
        competitionInteractor.getCompetion() { [unowned self] (qustions, error) in
            
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let qustions = qustions else { return }
                self.qustions = qustions
                
                self.view?.getCompetitionSuccess()
            }
        }
    }
    func getQuestionsCount() -> Int {
        return qustions.count
    }
    
    func configure(cell: CompetionCellView, for index: Int) {
        let question = qustions[index]
        let answers = question.answersList
        guard let questionText = question.question
            
            else { return }
        
        cell.displayFirstAnswer(firstAnswer: answers[0].answer!)
        cell.displaySecondAnswer(secondAnswer: answers[1].answer!)
        cell.displayThirdAnswer(thirdAnswer: answers[2].answer!)
        cell.displayQuestion(question: questionText)
        
    }
    //    func pushToDetails(viewController : OffersDetailsViewController, _ index : Int) {
    //        viewController.offer = offers[index]
    //
    //    }
    
}
