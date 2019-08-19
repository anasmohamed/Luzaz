//
//  OffersViewController.swift
//  Luzaz
//
//  Created by Admin on 7/10/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class OffersViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    // MARK: Outlets
   // @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var presenter: OffersPresenter!
    
    
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter = OffersPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad()
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: Actions
    /*@IBAction func addNewBarber(_ sender: UIBarButtonItem) {
     //let salonId = UserDefaults.standard.integer(forKey: "salonId")
     //presenter.addBarber(salonId: salonId, barber: barber)
     }*/
    
    // MARK: TableView
    func setupTableView() {
        collectionView.register(UINib(nibName: "OffersCell", bundle: nil), forCellWithReuseIdentifier: "OffersCell")
//        collectionView.register(UINib(nibName: "OffersCell", bundle: nil), forCellReuseIdentifier: "OffersCell")
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getOffersCount()

    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCell", for: indexPath) as! OffersCell
        presenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
 
    
    
    
}
