//
//  ConverstionViewController.swift
//  Luzaz
//
//  Created by jets on 1/14/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit

class ConverstionViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate{
    @IBOutlet weak var messageTextView: UITextField!
    var presenter : ConversationPresenter!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    var id : String?
    var userId : String?
    var receiverId : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ConversationPresenter(view : self)
        self.hideKeyboardWhenTappedAround()
        userId = UserDefaults.standard.string(forKey: "userId")
        tableView.rowHeight = UITableView.automaticDimension
             let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
                       logoImageView.isUserInteractionEnabled = true
                       logoImageView.addGestureRecognizer(tapGestureRecognizer)
        tableView.estimatedRowHeight = 300
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
            
            self.moveToBottom()
        }
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
           let homeViewController = ContainerVC()
           homeViewController.modalPresentationStyle = .fullScreen
                 present(homeViewController, animated: true, completion: nil)
       }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad(id: id!,paging: "nopaging")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.getConverstaionsCount()
        
    }
    @objc func keyboardWillShow(notify: NSNotification) {
        
        if let keyboardSize = (notify.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            
            if self.view.frame.origin.y == 0 {
                
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notify: NSNotification) {
        
        if let keyboardSize = (notify.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            
            if self.view.frame.origin.y != 0 {
                
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    func moveToBottom()  {
        presenter.moveToBottom(tableView: tableView)
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoversationCell", for: indexPath) as! ConversationTableViewCell
        presenter.configure(cell: cell, for: indexPath.row)
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
  
    @IBAction func sendMessageBtnWasPressed(_ sender: Any) {
        dismissKeyboard()
        if messageTextView.text != nil && messageTextView.text != ""
        {
            presenter.sendMessage(user:userId! , with:receiverId! , message: messageTextView.text!)
            messageTextView.text = ""
        }else{
            showError(error: "You Shoulde Write a Message")
        }
        moveToBottom()

    }
    
}
