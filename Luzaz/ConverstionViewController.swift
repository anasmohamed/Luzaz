//
//  ConverstionViewController.swift
//  Luzaz
//
//  Created by jets on 1/14/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit

class ConverstionViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var presenter : ConversationPresenter!
    @IBOutlet weak var tableView: UITableView!
    var id : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ConversationPresenter(view : self)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad(id: id!,paging: "nopaging")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.getConverstaionsCount()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoversationCell", for: indexPath)
        presenter.configure(cell: cell, for: indexPath.row)
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


   
}
