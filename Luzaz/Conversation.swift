//
//  Conversation.swift
//  Luzaz
//
//  Created by jets on 1/14/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import SwiftyJSON

class Conversation {
    var id : String?
    var sender : String?
    var receiver : String?
    var date : String?
    var speech : String?
    var attachmentsArray : String?
     init() {
        
    }
    init(withJSON data: JSON) {
        self.id = data[NetworkingConstants.conversationId].stringValue
        self.sender = data[NetworkingConstants.sender].stringValue
        self.receiver = data[NetworkingConstants.receiver].stringValue
        self.date = data[NetworkingConstants.date].stringValue
        self.speech = data[NetworkingConstants.speech].stringValue
        self.attachmentsArray = data[NetworkingConstants.attachmentsArray].stringValue
    }
    init(sender : String, receiver  : String , speech : String) {
        self.receiver = receiver
        self.speech = sender
        self.speech = speech
    }
}
