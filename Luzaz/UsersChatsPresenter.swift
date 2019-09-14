//
//  UsersChatsPresenter.swift
//  Luzaz
//
//  Created by jets on 1/10/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
class UsersChatsPresenter {
    private weak var view: UsersChatsView?
    private var friends: [User]
    private let usersChatsInteractor: UsersChatsInteractor
    private var friend: User?
    init(view: UsersChatsView?) {
        self.view = view
        usersChatsInteractor = UsersChatsInteractor()
        friends = [User]()
    }
    func viewDidLoad()  {
        getUsersChats(userId:UserDefaults.standard.string(forKey: "userId")!)
    }
    func getUsersChats(userId :String) {
        view?.showIndicator()
        usersChatsInteractor.getUsersChats(userId:userId) { [unowned self] (friends, error) in
            
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let friends =  friends else { return }
                self.friends = friends
                self.view?.getUsersChatsSuccess()
            }
        }
    }
    
    func getUsersChatsCount() -> Int {
        return friends.count
    }
    func configure(cell: UsersChatsCellView?, for index: Int) {
        let firend = friends[index]
      
        guard let name = firend.fullName,
        let image = firend.image
        else { return }
        
        cell?.displayUserImage(image: image)
        cell?.displayUserName(name: name)
    }
//    func pushToDetails(viewController : OffersDetailsViewController, _ index : Int) {
//        viewController.offer = offers[index]
//        
//    }
}
