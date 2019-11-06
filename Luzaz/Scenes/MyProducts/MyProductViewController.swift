//
//  MyProductViewController.swift
//  Luzaz
//
//  Created by jets on 17/9/19.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class MyProductViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var presenter: MyProductPresenter!
    var token : String!
    @IBAction func segmentedControlActionChanged(_ sender: Any) {
        tableView.reloadData()
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func switchCustomeTableViews(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter = MyProductPresenter(view : self)
        displayBackground()
        token = UserDefaults.standard.string(forKey: "token")!
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidLoad()
    }
    func setupTableView() {
        
        tableView.register(UINib(nibName: "MyProductTableViewCell", bundle: nil), forCellReuseIdentifier: "MyProductTableViewCell")
        tableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
    }
    
    func displayBackground()
    {
        switch segmentedControl.selectedSegmentIndex
        {
            
        case 0 :
            if presenter.getSellsCount() == 0
            {
                drowImageInTableBackgound()
            }
            
        case 1:
            if  presenter.getOrdersCount() == 0
            {
                drowImageInTableBackgound()
                
            }
        default: break
        }
    }
    func drowImageInTableBackgound()
    {
        let backgroundImage = UIImage(named: "nothingtoShow")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
    }
    
    
    private func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch segmentedControl.selectedSegmentIndex
        {
            
        case 0 :
            return presenter.getSellsCount()
        case 1:
            return presenter.getOrdersCount()
        default :
            return presenter.getSellsCount()
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        var offerId : String!
        let more = UITableViewRowAction(style: .normal, title: "Edit") { action, index in
            let sellYourItemVC = self.storyboard?.instantiateViewController(withIdentifier: "SellYourItemFirstVC") as! SellYourItemViewController
             offerId = self.presenter.getOfferId(index:index.row , segmentControlIndex:0)
            sellYourItemVC.modalPresentationStyle = .fullScreen
            sellYourItemVC.isEditProduct = true
            sellYourItemVC.cityName = self.presenter.getOfferCity(index: index.row)
            self.present(sellYourItemVC, animated: true, completion: nil)
        }
        more.backgroundColor = .lightGray
        
        let favorite = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            
            switch self.segmentedControl.selectedSegmentIndex
            {
            case 0:
                offerId =   self.presenter.getOfferId(index:index.row , segmentControlIndex:0)
                self.presenter.deleteItem(index: index.row,selectedSegmentIndex:0)
                
            case 1:
                offerId =   self.presenter.getOfferId(index:index.row , segmentControlIndex:1)
                self.presenter.deleteItem(index: index.row,selectedSegmentIndex:1)
                
            default:
                offerId =     self.presenter.getOfferId(index:index.row , segmentControlIndex:1)
                
            }
            
            self.presenter.deleteOffer(token:self.token,offer: offerId)
            self.tableView.deleteRows(at: [index], with: .automatic)
        }
        favorite.backgroundColor = .orange
        
        
        return [favorite,more]
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let offersDetailVC = storyboard?.instantiateViewController(withIdentifier: "OffersDetailsVC") as! OffersDetailsViewController
        presenter.pushToDetails(viewController: offersDetailVC,indexPath.row)
        offersDetailVC.modalPresentationStyle = .fullScreen
        self.present(offersDetailVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch segmentedControl.selectedSegmentIndex
        {
            
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyProductTableViewCell", for: indexPath) as! MyProductTableViewCell
            presenter.configure(cell: cell, for: indexPath.row)
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
            presenter.configure(cell: cell, for: indexPath.row)
            
            return cell
        default :
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
            presenter.configure(cell: cell, for: indexPath.row)
            
            return cell
            
        }
        
        
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "MyProductTableViewCell", for: indexPath) as! MyProductTableViewCell
        //        presenter.configure(cell: cell, for: indexPath.row)
        
        //        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}
