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
    private var presenter: CompetitionPresenter!
    var questionId : String?
    var questionCounter: Int = 0
    var answerId : String?
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = CompetitionPresenter(view: self)
    }
    func displayFirstOption(firstOption: String)
    {
        optionOneBtn.titleLabel?.text = firstOption
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad()
    }
    func displaySecondOption(secondOption: String)
    {
        optionTwoBtn.titleLabel?.text = secondOption
    }
    func displayThreeOption(threeOption: String)
    {
        optionThreeBtn.titleLabel?.text = threeOption
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
            questionId = presenter.getQuestionId(index: questionCounter)
            
            print("\(questionId)")
        }
        
    }
    @IBAction func answerBtnWasPressed(_ sender: UIButton) {
        questionCounter += 1
        updateQuestion()
        answerId = presenter.getAnswer(index: questionCounter)[sender.tag].answerId
        print("\(answerId)")
    }
    func updateUI(){
        quetionsNumber.text = "\(questionCounter + 1)/\(presenter.getQuestionsCount())"
        
    }
    func getCompetitionSuccess() {
    }
    
    func showIndicator() {
        spinner.startAnimating()
    }
    
    func hideIndicator() {
        spinner.stopAnimating()
    }
    
    
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    
}
