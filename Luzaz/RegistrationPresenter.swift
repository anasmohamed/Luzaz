//
//  RegisterPresenter.swift
//  Luzaz
//
//  Created by jets on 12/23/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation

class RegistrationPresenter {
    private weak var view: RegistrationView?
    private let userInteractor: UserInteractor?
    private var user: User?
    
    init(view: RegistrationView) {
        self.view = view
        user = User()
        userInteractor = UserInteractor()
    }
    
    func register(fullName: String,
                  phone : String,
                  email: String,
                  password: String,
                  confirmPassword: String) {
        
        if !isEmpty(string: fullName),
            !isEmpty(string: phone),
            !isEmpty(string: password),
            !isEmpty(string: confirmPassword),
            isValidEmailAddress(emailAddressString: email),
           // isValidPhoneNumber(phoneNumberString: phone),
            isValidPassword(password: password),
            isValidConfrimPassword(password: password, confirmPassword: confirmPassword) {
            
            let user = User()
            user.fullName = fullName
            user.phoneNumber = phone
            user.mail = email
            user.password = password
            
            view?.showIndicator()
            userInteractor?.register(user: user) { [unowned self] error in
                
                self.view?.hideIndicator()
                if let error = error {
                    self.view?.showError(error: error.localizedDescription)
                } else {
                    self.view?.registrationSuccess()
                }
            }
        } else {
            view?.showError(error: "Invalid Credentials")
        }
    }
    
    // MARK: Validation methods
    private func isEmpty(string: String) -> Bool {
        return string.isEmpty
    }
    
    private func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0 {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("Invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return returnValue
    }
    private func isValidPhoneNumber(phoneNumberString: String) -> Bool {
        
        var returnValue = true
        let phoneRegex = "^((\\+)|(00))[0-9]{6,14}$"
        
        do {
            let regex = try NSRegularExpression(pattern: phoneRegex)
            let nsString = phoneNumberString as NSString
            let results = regex.matches(in: phoneNumberString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0 {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("Invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return returnValue
    }

    private func isValidPassword(password: String) -> Bool {
        return !(password.isEmpty)
    }
    
    private func isValidConfrimPassword(password: String, confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
}
