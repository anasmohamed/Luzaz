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
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var presenter: FavoriteOffersPresneter!
    
    @IBOutlet weak var logoImageView: UIImageView!
    var shouldShowTabBar : Bool = false
    var token : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if shouldShowTabBar {
             AppDelegate.getAppDelegate().window?.rootViewController = AppDelegate.getAppDelegate().showTabBar()
        }
        setupTableView()
        presenter = FavoriteOffersPresneter(view: self)
        token = UserDefaults.standard.string(forKey: "token")!
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
                  logoImageView.isUserInteractionEnabled = true
                  logoImageView.addGestureRecognizer(tapGestureRecognizer)
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
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
           let homeViewController = ContainerVC()
           homeViewController.modalPresentationStyle = .fullScreen
                 present(homeViewController, animated: true, completion: nil)
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getFavoriteOffersCount()
    }
    //
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //
    ////        let offersDetailVC = storyboard?.instantiateViewController(withIdentifier: "OffersDetailsVC") as! OffersDetailsViewController
    ////        //presenter.pushToDetails(viewController: offersDetailVC,indexPath.row)
    ////        self.present(offersDetailVC, animated: true, completion: nil)
    //    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let offerId : String!
            offerId = presenter.getFavoriteOfferID(index: indexPath.row)
            presenter.deleteFavoriteOffer(token:token!,offer: offerId)
            presenter.deleteFavoriteOfferFromArray(index:indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
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
