//
//  SubCategoriesViewController.swift
//  Luzaz
//
//  Created by Admin on 7/8/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class SubCategoriesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var presenter : SubCategoriesPresenter!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var mainCategoryId : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SubCategoriesPresenter(view : self)
     
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad(mainCategoryId: mainCategoryId!)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.getSubCategoriesCount()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let subCategoryOffersVC = storyboard?.instantiateViewController(withIdentifier: "SubCategoryOffersVC") as! SubCategoryOffersViewController
        presenter.pushToDetails(viewController: subCategoryOffersVC,indexPath.row)
        self.present(subCategoryOffersVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryCell", for: indexPath) 
        presenter.configure(cell: cell, for: indexPath.row)
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}
