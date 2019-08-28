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
     @IBOutlet weak var spinner: UIActivityIndicatorView!
    var presenter: OffersPresenter!
    @IBOutlet weak var collectionView: UICollectionView!
    var delegate : CenterVCDelegate?
    
    var searchActive : Bool = false
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        presenter = OffersPresenter(view: self)
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Word"
        searchController.searchBar.sizeToFit()
        searchController.searchBar.becomeFirstResponder()
        self.navigationItem.titleView = searchController.searchBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad()
    }
    
    
    func setupCollectionView() {
        collectionView.register(UINib(nibName: "OffersCell", bundle: nil), forCellWithReuseIdentifier: "OffersCell")
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchActive {
            return presenter.getFilteredOffersCount()
        }
        else
        {
            return presenter.getOffersCount()
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCell", for: indexPath) as! OffersCell
        presenter.configure(cell: cell, for: indexPath.row,isFiltering: isFiltering())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellsAcross: CGFloat = 2
        let spaceBetweenCells: CGFloat = 1
        let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
        return CGSize(width: dim, height: dim)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let offersDetailsVC = storyboard?.instantiateViewController(withIdentifier: "OffersDetailsVC") as! OffersDetailsViewController
        offersDetailsVC.modalTransitionStyle = .flipHorizontal
        presenter.pushToDetails(viewController: offersDetailsVC, indexPath.row)
        self.present(offersDetailsVC,animated:true,completion:nil)
        
    }
    
    @IBAction func menuBtnWasPressed(_ sender: Any)
    {
        delegate?.toggleLeftPane()
        
    }

    
}
