//
//  OffersViewController.swift
//  Luzaz
//
//  Created by Admin on 7/10/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class OffersViewController: UITableViewController {
    // MARK: Outlets
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var presenter: OffersPresenter!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
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
    
    // MARK: Actions
    /*@IBAction func addNewBarber(_ sender: UIBarButtonItem) {
     //let salonId = UserDefaults.standard.integer(forKey: "salonId")
     //presenter.addBarber(salonId: salonId, barber: barber)
     }*/
    
    // MARK: TableView
    func setupTableView() {
        tableView.register(UINib(nibName: "OffersTableViewCell", bundle: nil), forCellReuseIdentifier: "OffersTableViewCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getOffersCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OffersTableViewCell", for: indexPath) as! BarberCell
        presenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    
    
}
