//
//  CompetionTableViewCell.swift
//  Luzaz
//
//  Created by jets on 1/19/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit
import DLRadioButton
class CompetionTableViewCell: UITableViewCell,CompetionCellView {
    @IBOutlet weak var secondAnswerBtn: DLRadioButton!
    @IBOutlet weak var thirdAnswerBtn: DLRadioButton!
    @IBOutlet weak var firstAnswerBtn: DLRadioButton!
    @IBOutlet weak var qustionLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func displayQuestion(question: String) {
        qustionLbl.text = question
    }
    func displayFirstAnswer(firstAnswer: String) {
        firstAnswerBtn.titleLabel?.text = firstAnswer
        
    }
    func displaySecondAnswer(secondAnswer: String) {
       secondAnswerBtn.titleLabel?.text = secondAnswer
    }
    func displayThirdAnswer(thirdAnswer: String) {
        thirdAnswerBtn.titleLabel?.text = thirdAnswer
    }
    @objc @IBAction private func logSelectedButton(radioButton : DLRadioButton) {
        if (radioButton.isMultipleSelectionEnabled) {
            for button in radioButton.selectedButtons() {
                print(String(format: "%@ is selected.\n", button.titleLabel!.text!));
            }
        } else {
            print(String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!));
        }
    }

    
}
