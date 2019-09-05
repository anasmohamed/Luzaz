//
//  SellYourItemEndPresenter.swift
//  Luzaz
//
//  Created by jets on 1/5/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
class SellYourItemEndPresenter {
    private weak var view: SellYourItemEndView?
    private let sellYourItemInteractor: SellYourItemInteractor
    private var user: User?
    
    init(view: SellYourItemEndView) {
        self.view = view
        user = User()
        sellYourItemInteractor = SellYourItemInteractor()
    }
    func setEmail(email : String)  {
        user?.email = email
    }
    func setFullName(fullName : String)  {
        user?.fullName = fullName
    }
    func setMobileNumber(mobileNumber : String)  {
        user?.phoneNumber = mobileNumber
    }
}
