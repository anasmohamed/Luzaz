//
//  FavoriteViewControllerTableViewController.swift
//  Luzaz
//
//  Created by jets on 1/23/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit

class FavoriteOffersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var presenter: FavoriteOffersPresneter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter = FavoriteOffersPresneter(view: self)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad()
    }
    func setupTableView() {
        tableView.register(UINib(nibName: "FavoriteOffersTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoriteOffersTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getFavoriteOffersCount()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let offersDetailVC = storyboard?.instantiateViewController(withIdentifier: "OffersDetailsVC") as! OffersDetailsViewController
        //presenter.pushToDetails(viewController: offersDetailVC,indexPath.row)
        self.present(offersDetailVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteOffersTableViewCell", for: indexPath) as! FavoriteOffersTableViewCell
        presenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}
