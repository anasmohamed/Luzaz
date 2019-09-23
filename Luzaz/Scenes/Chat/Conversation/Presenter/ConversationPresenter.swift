//
//  ConversationPresenter.swift
//  Luzaz
//
//  Created by jets on 1/14/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import UIKit
class ConversationPresenter {
    private weak var view: ConversationView?
    private let consersationInteractor: ConsersationInteractor
    private var conversation: Conversation?
    private var conversations: [Conversation]
    private var messageIds : [String]
    init(view: ConversationView) {
        self.view = view
        consersationInteractor = ConsersationInteractor()
        conversations = [Conversation]()
        messageIds = [String]()
    }
    
    func viewDidLoad(id : String , paging:String) {
        getConversation(id:id, paging: paging)
    }
    
    func getConversation(id: String,paging : String) {
        consersationInteractor.getConversation(id:id,paging :paging ) { [unowned self] (conversations, error) in
            
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let conversations = conversations else { return }
                self.conversations = conversations
                self.view?.getConversationSuccess()
            }
        }
    }
    func getConverstaionsCount() -> Int {
        return conversations.count
    }
  
    func sendMessage(user : String, with : String, message :String)  {
        consersationInteractor.addToConversation(user: user, with: with, speech: message){[unowned self] (messageIds, error) in
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                let message = Conversation(sender: user,receiver: with,speech: message)
                guard let messageIds = messageIds else { return }
                self.messageIds = messageIds
                self.conversations.append(message)
                self.view?.addConversationSucces()
                
            }
        }
    }
    func moveToBottom(tableView : UITableView) {
        
        if conversations.count > 0  {
            
            let indexPath = IndexPath(row: conversations.count - 1, section: 0)
            
            tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }
    func configure(cell: ConversationCellView, for index: Int) {
        let conversation = conversations[index]
        
//        guard let speech = conversation.speech
//            else { return }
        cell.configerMessageCell(conersation:conversation )
        
    }
 

}
