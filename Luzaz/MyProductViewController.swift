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

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func switchCustomeTableViews(_ sender: Any) {
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MyProductPresenter(view : self)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0 :
            return presenter.getOrderCount()
        case 1:
            return presenter.getOrderCount()
        default :
            return presenter.getOrderCount()

        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let subCategoryOffersVC = storyboard?.instantiateViewController(withIdentifier: "SubCategoryOffersVC") as! SubCategoryOffersViewController
        //presenter.pushToDetails(viewController: subCategoryOffersVC,indexPath.row)
        self.present(subCategoryOffersVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyProductTableViewCell", for: indexPath) as! MyProductTableViewCell
        presenter.configure(cell: cell, for: indexPath.row)
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


}
