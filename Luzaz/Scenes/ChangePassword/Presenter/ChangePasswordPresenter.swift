//
//  ChangePasswordPresenter.swift
//  Luzaz
//
//  Created by jets on 1/25/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
class ChangePasswordPresenter {
    private weak var view: ChangePasswordView?
    private let changePasswordInteractor: ChangePasswordInteractor?
    var message : String?
    init(view: ChangePasswordView) {
        self.view = view
        changePasswordInteractor = ChangePasswordInteractor()
        
    }
    
    
    func setPasswordByToken(token: String,password:String,rePassword:String)
    {
        view?.showIndicator()

        changePasswordInteractor?.setPasswordByToken(token: token,password:password,rePassword:rePassword) { [unowned self] (message, error) in
            self.view?.hideIndicator()

            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let message = message else { return }
                self.message = message
                self.view?.changePasswordSuccess(message)
            }
        }
        
        
    }
    

}
