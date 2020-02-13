////
////  CompetionTableViewCell.swift
////  Luzaz
////
////  Created by jets on 1/19/1441 AH.
////  Copyright © 1441 AH Luzaz. All rights reserved.
////
//
//import UIKit
//class CompetionTableViewCell: UITableViewCell,CompetionCellView {
// 
//    @IBOutlet weak var secondAnswerBtn: SSRadioButton!
//    @IBOutlet weak var thirdAnswerBtn: SSRadioButton!
//    @IBOutlet weak var firstAnswerBtn: SSRadioButton!
//    var indexPath : IndexPath!
//   // weak var delegate : QuestionsViewController?
//    var radioButtonController: SSRadioButtonsController?
//    @IBOutlet weak var qustionLbl: UILabel!
//    override func awakeFromNib() {
//        super.awakeFromNib()
//       
//    }
//   
//    
//    
//    func displayQuestion(question: String) {
//        qustionLbl.text = question
//    }
//    func displayFirstAnswer(firstAnswer: String) {
//        firstAnswerBtn.titleLabel?.text = firstAnswer
//        
//    }
//    func displaySecondAnswer(secondAnswer: String) {
//       secondAnswerBtn.titleLabel?.text = secondAnswer
//    }
//    func displayThirdAnswer(thirdAnswer: String) {
//        thirdAnswerBtn.titleLabel?.text = thirdAnswer
//    }
//    @IBAction func thirdAnswerBtnWasPressed(_ sender: Any) {
//        delegate?.thirdAnswerBtnWasPressed(cellIndex: indexPath)
//    }
//    
//    @IBAction func secondAnswerBtnWasPressed(_ sender: Any) {
//        delegate?.secondAnswerBtnWasPressed(cellIndex: indexPath)
//    }
//    @IBAction func firstBtnWasPressed(_ sender: Any) {
//        delegate?.thirdAnswerBtnWasPressed(cellIndex: indexPath)
//    }
//    
////    @objc @IBAction private func logSelectedButton(radioButton : DLRadioButton) {
////        if (radioButton.isMultipleSelectionEnabled) {
////            for button in radioButton.selectedButtons() {
////                print(String(format: "%@ is selected.\n", button.titleLabel!.text!));
////            }
////        } else {
////            print(String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!));
////        }
////    }
////
//    
//}
//protocol CompetationTableViewCellDelegate :class{
//    func thirdAnswerBtnWasPressed(cellIndex:IndexPath)
//    func secondAnswerBtnWasPressed(cellIndex:IndexPath)
//    func firstAnswerBtnWasPressed(cellIndex:IndexPath)
//}
