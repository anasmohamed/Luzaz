//
//  LanguagesViewController.swift
//  Luzaz
//
//  Created by jets on 12/22/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import UIKit

class LanguagesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        UserDefaults.standard.set(cell?.textLabel?.text, forKey: "language")
        let languageVC = storyboard?.instantiateViewController(withIdentifier: "OffersVC") as! OffersViewController
        self.present(languageVC, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Choose Language"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath)
        switch indexPath.row  {
        case 0:
            cell.textLabel?.text = "English"
            
        case 1:
            cell.textLabel?.text = "عربى"
            cell.textLabel?.textAlignment = .right
        default :
            cell.textLabel?.text = "English"
            
        }
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}