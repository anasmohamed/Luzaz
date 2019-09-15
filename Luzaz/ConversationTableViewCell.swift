//
//  ConversationTableViewCell.swift
//  Luzaz
//
//  Created by jets on 1/15/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit

class ConversationTableViewCell: UITableViewCell ,ConversationCellView{
    
    
    @IBOutlet weak var recievedMessageLbl : UILabel!
    @IBOutlet weak var recievedMessageView : UIView!
    
    @IBOutlet weak var sentMessageLbl : UILabel!
    @IBOutlet weak var sentMessageView : UIView!
    var userId : String!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userId = UserDefaults.standard.string(forKey: "userId")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configerMessageCell(conersation: Conversation) {
        if conersation.sender == userId
        {
            sentMessageLbl.text = conersation.speech
            recievedMessageView.isHidden =  true
            recievedMessageLbl.text = ""
            sentMessageView.isHidden = false
        }else
        {
            recievedMessageLbl.text = conersation.speech
            recievedMessageView.isHidden =  false
            sentMessageLbl.text = ""
            sentMessageView.isHidden = true
        }
        
    }

}
