//
//  ChatViewController.swift
//  Luzaz
//
//  Created by Admin on 7/10/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class UsersChatsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    private var presenter: UsersChatsPresenter!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = UsersChatsPresenter(view: self)
        presenter.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func setupTableView() {
        tableView.register(UINib(nibName: "UserChatsTableViewCell", bundle: nil), forCellReuseIdentifier: "UserChatsTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let languageVC = storyboard?.instantiateViewController(withIdentifier: "Chat") as! LanguagesViewController
        self.present(languageVC, animated: true, completion: nil)
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.getUsersChatsCount()
        
    }
    
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserChatsTableViewCell", for: indexPath) as! UserChatsTableViewCell
        presenter.configure(cell: cell, for: indexPath.row)
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}
