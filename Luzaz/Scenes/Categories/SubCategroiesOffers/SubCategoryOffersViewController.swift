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
    var country : String?
    var subCategoryId : String?
    var pageNumber = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
      country = UserDefaults.standard.string(forKey: "country")
        presenter = SubCategoryOffersPresenter(view: self)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad(subCategoryId : subCategoryId!,country:country! ,perPage:"10",page:String(pageNumber))
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "SubCategoryOffersTableViewCell", bundle: nil), forCellReuseIdentifier: "SubCategoryOffersTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(indexPath.row + 1 , forKey: "country")
         let offersDetailsVC = storyboard?.instantiateViewController(withIdentifier: "OffersDetailsVC") as! OffersDetailsViewController
               offersDetailsVC.modalPresentationStyle = .fullScreen
               presenter.pushToDetails(viewController: offersDetailsVC, indexPath.row)
               self.present(offersDetailsVC,animated:true,completion:nil)
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.getSubCategoryOffersCount()
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryOffersTableViewCell", for: indexPath) as! SubCategoryOffersTableViewCell
        presenter.configure(cell: cell, for: indexPath.row)
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func getCountries() {
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row == presenter.getSubCategoryOffersCount() - 1) { //it's your last cell
                  pageNumber += 1
             presenter.viewDidLoad(subCategoryId : subCategoryId!,country:country! ,perPage:"10",page:String(pageNumber))
                  DispatchQueue.main.async {
                      self.tableView.reloadData()
                      self.presenter.isOfferEmpty = true
                  }
                  
              }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        AppDelegate.getAppDelegate().MenuContainerVC.toggleLeftPane()
        dismiss(animated: true, completion: nil)
    }
}
