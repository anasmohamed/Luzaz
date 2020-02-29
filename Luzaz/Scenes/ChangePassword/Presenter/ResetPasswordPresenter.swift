//
//  ResetPasswordPresenter.swift
//  Luzaz
//
//  Created by Anas Mohamed on 2/29/20.
//  Copyright © 2020 Luzaz. All rights reserved.
//

import Foundation


class ResetPasswordPresenter {
    private weak var view: ResetPasswordView?
    private let changePasswordInteractor: ChangePasswordInteractor?
    var message : String?
    init(view: ResetPasswordView) {
        self.view = view
        changePasswordInteractor = ChangePasswordInteractor()
        
    }
    
    
    func setPasswordByToken(token: String,password:String,rePassword:String)
    {
        view?.showIndicator()

        changePasswordInteractor?.setPasswordByEmailToken(token: token,password:password,rePassword:rePassword) { [unowned self] (message, error) in
            self.view?.hideIndicator()

            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let message = message else { return }
                self.message = message
                self.view?.resetPasswordSuccess(message: message)
            }
        }
        
        
    }
    
    
  
}
