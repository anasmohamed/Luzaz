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
    var reseller_id:String?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = OfferDetailesPresenter(productView:self)
      presenter.getMoreFromThisSeller(country:UserDefaults.standard.string(forKey: "country")! , user: reseller_id!)
        tableView.delegate = self
                     tableView.dataSource = self
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         let offersDetailsVC = storyboard?.instantiateViewController(withIdentifier: "OffersDetailsVC") as! OffersDetailsViewController
              offersDetailsVC.modalPresentationStyle = .fullScreen
              presenter.pushToDetails(viewController: offersDetailsVC, indexPath.row)
              self.present(offersDetailsVC,animated:true,completion:nil)

    }
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func getMySellingProductsSuccess() {
        setupTableView()

        tableView.reloadData()
    }
    
    func getMyOrdersSuccess() {
        
    }
    
    func offerDeletedSuccessfuly(message: String) {
        
    }
    
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
