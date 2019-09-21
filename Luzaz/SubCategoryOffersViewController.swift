//
//  AllProductsUnderSubCategoriesViewController.swift
//  Luzaz
//
//  Created by Admin on 7/10/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class SubCategoryOffersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    private var presenter: SubCategoryOffersPresenter!
    
    @IBOutlet weak var tableView: UITableView!
    
    var mainCategoryId : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter = SubCategoryOffersPresenter(view: self)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad(mainCategoryId: mainCategoryId!)
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "SubCategoryOfferCell", bundle: nil), forCellReuseIdentifier: "SubCategoryOfferCell")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(indexPath.row + 1 , forKey: "country")
        
        let languageVC = storyboard?.instantiateViewController(withIdentifier: "LangaugesVC") as! LanguagesViewController
        self.present(languageVC, animated: true, completion: nil)
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.getSubCategoryOffersCount()
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryOfferCell", for: indexPath) as! SubCategoryOffersTableViewCell
        presenter.configure(cell: cell, for: indexPath.row)
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func getCountries() {
        tableView.reloadData()
    }
    
}
