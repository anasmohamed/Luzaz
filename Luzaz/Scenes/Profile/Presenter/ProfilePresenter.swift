//
//  ProfilePresenter.swift
//  Luzaz
//
//  Created by jets on 1/25/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
class ProfilePresenter {
    
    private weak var view: ProfileView?
    private let profileInteractor: ProfileInteractor?
    var message : String?
    init(view: ProfileView) {
        self.view = view
        profileInteractor = ProfileInteractor()
        
    }

    
    func logoutUser(user: String)
    {
        profileInteractor?.logoutUser(userId: user) { [unowned self] (message, error) in
            
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let message = message else { return }
                self.message = message
                self.view?.logoutSuccess()
            }
        }
        
        
    }

}
