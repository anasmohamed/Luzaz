//
//  ConversationView.swift
//  Luzaz
//
//  Created by jets on 1/14/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
protocol ConversationView :class{
    
    func getConversationSuccess()
    func showError(error: String)
}
