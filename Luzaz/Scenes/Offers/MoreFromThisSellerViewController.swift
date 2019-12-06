//
//  MoreFromThisSellerViewController.swift
//  Luzaz
//
//  Created by Anas Mohamed on 12/6/19.
//  Copyright © 2019 Luzaz. All rights reserved.
//

import UIKit

class MoreFromThisSellerViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource, MyProductView{
    func showError(error: String) {
        
    }
    
    var presenter: OfferDetailesPresenter!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = OfferDetailesPresenter(productView:self)
        setupTableView()
        // Do any additional setup after loading the view.
    }
    func setupTableView() {
        
        tableView.register(UINib(nibName: "MyProductTableViewCell", bundle: nil), forCellReuseIdentifier: "MyProductTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getSellsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyProductTableViewCell", for: indexPath) as? MyProductTableViewCell else {fatalError("Unabel to create cell")}
        
        presenter.configure(cell:cell , for:indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func getMySellingProductsSuccess() {
        tableView.reloadData()
    }
    
    func getMyOrdersSuccess() {
        
    }
    
    func offerDeletedSuccessfuly(message: String) {
        
    }
    
    
}
