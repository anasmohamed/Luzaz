//
//  QuestionsViewController.swift
//  Luzaz
//
//  Created by jets on 1/19/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CompetationTableViewCellDelegate,SSRadioButtonControllerDelegate {
    var radioButtonController: SSRadioButtonsController?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var presenter: CompetitionPresenter!
    var userPhone : String?
    var userEmail : String?
    var userFristName : String?
    var userLastName : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.allowsSelection = false;

        presenter = CompetitionPresenter(view: self)
        radioButtonController = SSRadioButtonsController()
        radioButtonController?.delegate = self;
        radioButtonController?.respectTableView = true;
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad()
    }
    func setupTableView() {
        tableView.register(UINib(nibName: "CompetionTableViewCell", bundle: nil), forCellReuseIdentifier: "CompetionTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        UserDefaults.standard.set(indexPath.row + 1 , forKey: "country")
//        
//        let languageVC = storyboard?.instantiateViewController(withIdentifier: "LangaugesVC") as! LanguagesViewController
//        self.present(languageVC, animated: true, completion: nil)
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getQuestionsCount()
        
    }

    func didSelectButton(selectedButton: UIButton?, index: Int) {
        NSLog(" \(String(describing: selectedButton))" )
        print("anas")

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompetionTableViewCell", for: indexPath) as! CompetionTableViewCell
        cell.firstAnswerBtn.tag = indexPath.row
        radioButtonController?.addButton(cell.firstAnswerBtn)
        
                cell.firstAnswerBtn.isSelected = (radioButtonController?.isSelected(index: indexPath.row))!
                cell.firstAnswerBtn.toggleButon()
     //   presenter.configure(cell: cell, for: indexPath.row)
  
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func firstAnswerBtnWasPressed(cellIndex: IndexPath) {
        print("anas")
    }
    func secondAnswerBtnWasPressed(cellIndex: IndexPath) {
        print("ali")

    }
    func thirdAnswerBtnWasPressed(cellIndex: IndexPath) {
        print("ahmed")
    }
    @IBAction func answerBtnWasPressed(_ sender: Any) {
//        presenter.addCompetitionEnrolment(id:presenter.getCompetitionId() , lang: , questions:presenter.getQuestionsId , answers: , firstName: userFristName, lastName: userLastName, phone: userPhone, email: userEmail)
    }
}
