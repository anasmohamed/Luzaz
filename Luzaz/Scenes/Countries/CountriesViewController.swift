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
    var delegate : CenterVCDelegate?
    let prefs = UserDefaults.standard
    var isLeftSideController = false
    var countryImage : UIImageView?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter = CountryPresenter(view: self)
        presenter.viewDidLoad()
        tableView.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
    }
    
    
    func setupTableView() {
        tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("counrty name \(presenter.getCountryName(index: indexPath.row))")

        switch  presenter.getCountryName(index: indexPath.row).localiz(){
        case "Egypt".localiz():
            UserDefaults.standard.set(1 , forKey: "country")
        case "USA".localiz():
            UserDefaults.standard.set(10 , forKey: "country")
        case "Emirates".localiz():
            UserDefaults.standard.set(2 , forKey: "country")
        case "Saudi Arabia".localiz():
            UserDefaults.standard.set(5 , forKey: "country")
        default:
            UserDefaults.standard.set(9 , forKey: "country")
            
        }
        if isLeftSideController == false{
            let languageVC = storyboard?.instantiateViewController(withIdentifier: "LangaugesVC") as! LanguagesViewController
            languageVC.modalPresentationStyle = .fullScreen
            self.present(languageVC, animated: true, completion: nil)
        }else{
            print("index path \(getCountyIcon(countryNum : indexPath.row))")
            countryImage?.image = UIImage(named: getCountyIcon(countryNum : indexPath.row) )
            let offerVC = ContainerVC()
            offerVC.modalPresentationStyle = .fullScreen
            present(offerVC, animated: true, completion:  nil)
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
        cell.displayCountryImage(image: getCountyIcon(countryNum: indexPath.row))
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
            return "Egypt"
        case 1:
            return "USA"
        case 2:
            return "Emirates"
        case 3:
            return "Saudi Arabia"
        default:
            return "Libya"
        }
    }
}
