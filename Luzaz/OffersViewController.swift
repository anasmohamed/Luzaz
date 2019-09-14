//
//  OffersViewController.swift
//  Luzaz
//
//  Created by Admin on 7/10/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class OffersViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,
UISearchBarDelegate,UISearchControllerDelegate{
    @IBOutlet weak var searchBar: UISearchBar!
    // MARK: Outlets
     @IBOutlet weak var spinner: UIActivityIndicatorView!
    var presenter: OffersPresenter!
    @IBOutlet weak var collectionView: UICollectionView!
     var delegate : CenterVCDelegate?
    

    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        presenter = OffersPresenter(view: self)
        searchBar.delegate = self
        
        self.hideKeyboardWhenTappedAround()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad()
    }
    
    
    func setupCollectionView() {
        collectionView.register(UINib(nibName: "OffersCell", bundle: nil), forCellWithReuseIdentifier: "OffersCell")
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if !searchBarIsEmpty() {
            return presenter.getFilteredOffersCount()
        }
        else
        {
            return presenter.getOffersCount()
            
        }
        //return presenter.getFilteredOffersCount()
    }
    // This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
       presenter.getSearchedOffer(searchText: searchText)
        
        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCell", for: indexPath) as! OffersCell
        presenter.configure(cell: cell, for: indexPath.row,isFiltering:!searchBarIsEmpty())
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
func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            collectionView.reloadData()
        }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        collectionView.reloadData()

    }
        func searchBarIsEmpty() -> Bool {
            // Returns true if the text is empty or nil
            return searchBar.text?.isEmpty ?? true
        }
    @IBAction func menuBtnWasPressed(_ sender: Any)
    {
        delegate?.toggleLeftPane()
       
    }

    
}
