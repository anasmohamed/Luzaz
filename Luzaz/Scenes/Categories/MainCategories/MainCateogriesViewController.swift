//
//  MainGateogriesViewController.swift
//  Luzaz
//
//  Created by jets on 1/11/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit

class MainCateogriesViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UISearchBarDelegate ,UISearchControllerDelegate,UICollectionViewDelegateFlowLayout{
    
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    // MARK: Outlets
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var presenter: MainCategoriesPresenter!
    @IBOutlet weak var collectionView: UICollectionView!
    var delegate : CenterVCDelegate?
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        presenter = MainCategoriesPresenter(view: self)
        searchBar.delegate = self
        self.hideKeyboardWhenTappedAround()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func setupCollectionView() {
        collectionView.register(UINib(nibName: "MainCateoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCateoriesCollectionViewCell")
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if !searchBarIsEmpty() {
            return presenter.getFilteredMainCategoriesCount()
        }
        else
        {
            return presenter.getMainCategoriesCount()
            
        }
        //return presenter.getFilteredOffersCount()
    }
    // This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // When there is no text, filteredData is the same as the original data
        // When user has entered text into the search box
        // Use the filter method to iterate over all items in the data array
        // For each item, return true if the item should be included and false if the
        // item should NOT be included
        presenter.getSearchedCategories(searchText: searchText)
        
        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCateoriesCollectionViewCell", for: indexPath) as! MainCateoriesCollectionViewCell
        presenter.configure(cell: cell, for: indexPath.row,isFiltering:!searchBarIsEmpty())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellsAcross: CGFloat = 2
        let spaceBetweenCells: CGFloat = 10
        let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
        return CGSize(width: dim, height: dim)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let subCategoriesVC = storyboard?.instantiateViewController(withIdentifier: "SubCategoriesVC") as! SubCategoriesViewController
        subCategoriesVC.modalPresentationStyle = .fullScreen
        presenter.pushToDetails(viewController: subCategoriesVC, indexPath.row)
        self.present(subCategoriesVC,animated: true, completion: nil)
        
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
    
    @IBAction func menuBtnWasPressed(_ sender: Any) {
        AppDelegate.getAppDelegate().MenuContainerVC.togglePane()
        dismiss(animated: true, completion: nil)
    }
    
}
