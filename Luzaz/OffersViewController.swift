//
//  OffersViewController.swift
//  Luzaz
//
//  Created by Admin on 7/10/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class OffersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    // MARK: Outlets
   // @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var presenter: OffersPresenter!
    
    
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter = OffersPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad()
    }
    
    @IBOutlet weak var tableView: UITableView!
    // MARK: Actions
    /*@IBAction func addNewBarber(_ sender: UIBarButtonItem) {
     //let salonId = UserDefaults.standard.integer(forKey: "salonId")
     //presenter.addBarber(salonId: salonId, barber: barber)
     }*/
    
    // MARK: TableView
    func setupTableView() {
        tableView.register(UINib(nibName: "OffersTableViewCell", bundle: nil), forCellReuseIdentifier: "OffersTableViewCell")
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getOffersCount()
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OffersTableViewCell", for: indexPath) as! OffersTableViewCell
        presenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    
    
}
