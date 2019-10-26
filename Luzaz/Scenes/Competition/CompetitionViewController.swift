//
//  CompetitonViewController.swift
//  Luzaz
//
//  Created by jets on 1/25/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit

class CompetitionViewController: UIViewController, CompetitionView{
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var optionTwoBtn: UIButton!
    @IBOutlet weak var optionOneBtn: UIButton!
    @IBOutlet weak var quetionsNumber: UILabel!
    @IBOutlet weak var optionThreeBtn: UIButton!
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private var presenter: CompetitionPresenter!
    var questionId : [String] = []
    var questionCounter: Int = 0
    var answerId : [String] = []
    var userPhone : String?
    var userEmail : String?
    var userFristName : String?
    var userLastName : String?
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        presenter = CompetitionPresenter(view: self)
        answerId = [String]()
        questionId = [String]()
    }
    func displayFirstOption(firstOption: String)
    {
        optionOneBtn.setTitle(firstOption, for: UIControl.State.normal)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad()
    }
    func displaySecondOption(secondOption: String)
    {
        optionTwoBtn.setTitle(secondOption, for: UIControl.State.normal)
    }
    func displayThreeOption(threeOption: String)
    {
        optionThreeBtn.setTitle(threeOption, for: UIControl.State.normal)
    }
    
    func displayQuestion(question: String)
    {
        questionLbl.text = question
    }
    func updateQuestion(){
        if questionCounter < presenter.getQuestionsCount()
        {
            displayQuestion(question: presenter.getQuestions(index: questionCounter))
            
            displayFirstOption(firstOption:presenter.getAnswer(index: questionCounter)[0].answer!)
            displaySecondOption(secondOption:presenter.getAnswer(index: questionCounter)[1].answer!)
            displayThreeOption(threeOption:presenter.getAnswer(index: questionCounter)[2].answer!)
            updateUI()
            questionId.append(presenter.getQuestionId(index: questionCounter))
           // questionId.joined(separator: ",")
        }else{
            presenter.addCompetitionEnrolment(id:presenter.getCompetitionId()!,lang:"en",questions: questionId.joined(separator: ","),answers: answerId.joined(separator: ","),firstName:
                
                userFristName ?? "",lastName: userLastName ?? "",phone: userPhone ?? "",email: userEmail ?? "")
            let offerVC = ContainerVC()
            self.present(offerVC,animated: true,completion: nil)
 

        }
        
    }
    @IBAction func answerBtnWasPressed(_ sender: UIButton) {
        answerId.append(presenter.getAnswer(index: questionCounter)[sender.tag].answerId!)

        questionCounter += 1

        updateQuestion()
    }
    func updateUI(){
        quetionsNumber.text = "\(questionCounter + 1)/\(presenter.getQuestionsCount())"
        
    }
    func getCompetitionSuccess() {
        displayQuestion(question: presenter.getQuestions(index: questionCounter))
        displayFirstOption(firstOption:presenter.getAnswer(index: questionCounter)[0].answer!)
        displaySecondOption(secondOption:presenter.getAnswer(index: questionCounter)[1].answer!)
     displayThreeOption(threeOption:presenter.getAnswer(index: questionCounter)[2].answer!)
        updateUI()
    }
    
    func showIndicator() {
        spinner.startAnimating()
    }
    
    func hideIndicator() {
        spinner.stopAnimating()
    }
    
    
    
    func showError(error: String,content : String) {
         let alert = UIAlertController(title: title, message: content, preferredStyle: .alert)
                 alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                     switch action.style{
                     case .default:
                      
                      let offersVC = ContainerVC()
                      offersVC.modalPresentationStyle = .fullScreen
                      self.present(offersVC,animated:true,completion:nil)
                     case .cancel:
                         print("cancel")

                     case .destructive:
                         print("destructive")

                     }}))
                 self.present(alert, animated: true, completion: nil)
    }
    
    
    
}
