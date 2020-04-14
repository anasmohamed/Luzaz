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
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var token : String = ""
    var shouldShowTabBar : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
      
        setupTableView()
        presenter = UsersChatsPresenter(view: self)
             let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
                       logoImageView.isUserInteractionEnabled = true
                       logoImageView.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // if !(token.isEmpty){
                  presenter.viewDidLoad()

//               }else{

//    if !UIAccessibility.isReduceTransparencyEnabled {
//        view.backgroundColor = .clear
//
//        let blurEffect = UIBlurEffect(style: .dark)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        //always fill the view
//        blurEffectView.frame = self.view.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        view.addSubview(blurEffectView) //if you have more UIViews, use an insertSubview API to place it where needed
//    } else {
//        view.backgroundColor = .black
//    }
                    //showError(error: "you should login".localiz())
     //              showError(error: "you should login".localiz())
            //   }
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
          let homeViewController = ContainerVC()
           homeViewController.modalPresentationStyle = .fullScreen
                 present(homeViewController, animated: true, completion: nil)
       }
    func setupTableView() {
        tableView.register(UINib(nibName: "UserChatsTableViewCell", bundle: nil), forCellReuseIdentifier: "UserChatsTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let backItem = UIBarButtonItem()
//        backItem.title = "Back"
//        navigationItem.backBarButtonItem = backItem
        let conversationVC = storyboard?.instantiateViewController(withIdentifier: "ConverstionVC") as! ConverstionViewController
        presenter.pushToDetails(viewController: conversationVC, indexPath.row)
        conversationVC.modalPresentationStyle = .fullScreen
        self.present(conversationVC, animated: true, completion: nil)
//        self.navigationController?.pushViewController(conversationVC, animated: true)
        
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
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
