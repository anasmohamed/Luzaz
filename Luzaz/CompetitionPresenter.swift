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
    //private var qustions : [Question]
    init(view: CompetitionView) {
        self.view = view
        competitionInteractor = CompetitionInteractor()
        competations = [Competation]()
    }
    
    func viewDidLoad() {
        
       
        getQuestions()
        
    }
    
    func getQuestions() {
        view?.showIndicator()
        competitionInteractor.getCompetion() { [unowned self] (competations, error) in
            
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let competations = competations else { return }
                self.competations = competations
                
                self.view?.getCompetitionSuccess()
            }
        }
    }
    func getQuestionsCount() -> Int {
        return competations.count
    }

    func configure(cell: CompetionCellView, for index: Int) {
        //let questionList = competations[index].questionsList
//        for
//        guard let questionText = question.questionsList[index]
//            else { return }
        
       
    }
//    func pushToDetails(viewController : OffersDetailsViewController, _ index : Int) {
//        viewController.offer = offers[index]
//        
//    }

}
