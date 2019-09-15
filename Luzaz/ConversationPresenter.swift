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
    init(view: ConversationView) {
        self.view = view
        consersationInteractor = ConsersationInteractor()
        conversations = [Conversation]()
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
  
 
    
    func configure(cell: UITableViewCell, for index: Int) {
        let conversation = conversations[index]
        
        guard let speech = conversation.speech
            else { return }
        cell.textLabel?.text = speech
        
        
    }
 

}
