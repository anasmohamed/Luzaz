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
    private var competitonId : String?
    private var qustions : [Question]
    private var arQustions : [Question]

    private var image : String?
    init(view: CompetitionView) {
        self.view = view
        competitionInteractor = CompetitionInteractor()
        competations = [Competation]()
        qustions =  [Question]()
        arQustions = [Question]()
    }
    
    func viewDidLoad() {
        getQuestions()
    }
    
    func addCompetitionEnrolment (id:String , lang: String, questions: String, answers: String, firstName: String, lastName: String, phone: String, email: String)  {
        view?.showIndicator()
        competitionInteractor.addCompetitionEnrolment(id: id, lang: lang, questions: questions, answers: answers, firstName: firstName, lastName: lastName, phone: phone, email: email){
            [unowned self] (percentage,code, error) in
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: "Error".localiz(),content : error.localizedDescription,code:code!)
            } else {
                if code == "0"{
                    self.view?.showError(error:"Success".localiz(),content :percentage!,code: code!)}
                else{
                    self.view?.showError(error:"Fail".localiz(),content :percentage!,code:code!)}
                
            }
            
            
        }
    }
    func getQuestions() {
        view?.showIndicator()
        competitionInteractor.getCompetion() { [unowned self] (qustions,arQustions,competitionId,image, error) in
            
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: "Error",content:error.localizedDescription ,code :"")
            } else {
                guard let qustions = qustions else { return }
                self.qustions = qustions
                self.arQustions = arQustions ?? []
                self.competitonId = competitionId
                self.image = image
                self.view?.getCompetitionSuccess()
            }
        }
    }
    func getQuestionsCount() -> Int {
        return qustions.count
    }
    func getCompetitionId() -> String? {
        return competitonId
    }
    
//    func getQuestionsId() -> String {
//        var questionsId : String?
////        for question in qustions
////        {
////          questionsId = question.questionId! + ","
////        }
//        return questionsId!
//    }
    func getQuestions(index : Int) -> String {
        return qustions[index].question!
    }
    func getArabicQuestions(index : Int) -> String? {
        return arQustions[index].question ?? ""
    }
    func getAnswer(index:Int) -> [Answer]
    {
        return qustions[index].answersList
    }
    func getQuestionId(index : Int) ->String{
        return qustions[index].questionId!
    }
    func configure(cell: CompetionCellView, for index: Int) {
        let question = qustions[index]
        let arQuestion = arQustions[index]
         let answers = question.answersList
        guard let questionText = question.question
           
            else { return }
        
        cell.displayFirstAnswer(firstAnswer: answers[0].answer!)
        cell.displaySecondAnswer(secondAnswer: answers[1].answer!)
        cell.displayThirdAnswer(thirdAnswer: answers[2].answer!)
        cell.displayQuestion(question: questionText,arQuestion: arQuestion.question ?? "")
        
    }
    func getImage() -> String
    {
        return image ?? ""
    }
    //    func pushToDetails(viewController : OffersDetailsViewController, _ index : Int) {
    //        viewController.offer = offers[index]
    //
    //    }
    
}
