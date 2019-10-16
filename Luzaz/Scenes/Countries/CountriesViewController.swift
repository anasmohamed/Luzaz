//
//  LanguagesViewController.swift
//  Luzaz
//
//  Created by jets on 12/21/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CountryView {
    private var presenter: CountryPresenter!
    let prefs = UserDefaults.standard
    var isLeftSideController = false
    var countryImage : UIImageView?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter = CountryPresenter(view: self)
        presenter.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func setupTableView() {
        tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(indexPath.row + 1 , forKey: "country")
        if isLeftSideController == false{
            let languageVC = storyboard?.instantiateViewController(withIdentifier: "LangaugesVC") as! LanguagesViewController
            self.present(languageVC, animated: true, completion: nil)
        }else{
            countryImage?.image = UIImage(named: getCountyIcon(countryNum : indexPath.row) )
           AppDelegate.getAppDelegate().MenuContainerVC.toggleLeftPane()
            dismiss(animated: true, completion: nil)
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.getCountriesCount()
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Choose Country"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        presenter.configure(cell: cell, for: indexPath.row)
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func getCountries() {
        tableView.reloadData()
    }
    func getCountyIcon(countryNum : Int) -> String {
        switch countryNum {
        case 0:
            return "egypt"
        case 1:
            return "usa"
        case 2:
            return "emirates"
        case 3:
            return "saudi_arabia"
        default:
            return "libya"
        }
    }
}
