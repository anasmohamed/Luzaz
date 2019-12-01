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
        print("Deleted")

        self.tableView.deleteRows(at: [indexPath], with: .automatic)
      }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let offersDetailVC = storyboard?.instantiateViewController(withIdentifier: "OffersDetailsVC") as! OffersDetailsViewController
        presenter.pushToDetails(viewController: offersDetailVC,indexPath.row)
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
