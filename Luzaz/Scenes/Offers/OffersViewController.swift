//
//  OffersViewController.swift
//  Luzaz
//
//  Created by Admin on 7/10/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit
import MOLH
import SDWebImage
import Siren
class OffersViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,
UISearchBarDelegate,UISearchControllerDelegate{
    @IBOutlet weak var searchBar: UISearchBar!
    // MARK: Outlets
    var footerView:CollectionReusableView?
       var items = [Int]()
       var isLoading:Bool = false
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var presenter: OffersPresenter!
    @IBOutlet weak var collectionView: UICollectionView!
    var delegate : CenterVCDelegate?
    private var layoutOption: LayoutOption = .largeGrid {
        didSet {
            setupLayout(with: view.bounds.size)
        }
    }
    var language : String?
    var countryId : String?
     var pageNumber = 0;
    
    @IBOutlet weak var logoImageView: UIImageView!
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      //  setupSideMenu()
      
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
                  logoImageView.isUserInteractionEnabled = true
                  logoImageView.addGestureRecognizer(tapGestureRecognizer)
        setupCollectionView()
        if let layout = collectionView.collectionViewLayout as? OffersLayout {
                      layout.delegate = self
                    }
        countryId = UserDefaults.standard.string(forKey: "country")!
        presenter = OffersPresenter(view: self)
        searchBar.delegate = self
        setupLayout(with: view.bounds.size)
        self.hideKeyboardWhenTappedAround()
        language = MOLHLanguage.currentAppleLanguage()
         Siren.shared.wail()
       
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
          let homeViewController = ContainerVC()
           homeViewController.modalPresentationStyle = .fullScreen
                 present(homeViewController, animated: true, completion: nil)
       }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            self.layoutOption = .smallGrid

        } else {
            self.layoutOption = .largeGrid

        }
        setupLayout(with: size)
    }
 
    
 
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupLayout(with: view.bounds.size)
    }
  
    private func setupLayout(with containerSize: CGSize) {
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }

        switch layoutOption {


        case .largeGrid, .smallGrid:
            let minItemWidth: CGFloat
            if layoutOption == .smallGrid {
                minItemWidth = 50
            } else {
                minItemWidth = 100
            }

            let numberOfCell = containerSize.width / minItemWidth
            let width = floor((numberOfCell / floor(numberOfCell)) * minItemWidth)
            let height = ceil(width * 10)
            flowLayout.minimumInteritemSpacing = 10
            flowLayout.minimumLineSpacing = 10
            flowLayout.itemSize = CGSize(width: width, height: height)
            flowLayout.sectionInset = .zero
        }

        collectionView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad(countryId: countryId ?? "1", page: String(pageNumber))

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
           print(presenter.getOffersCount())
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
      
        switch layoutOption {
        case .largeGrid:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCell", for: indexPath) as! OffersCell
            cell.offerImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
            presenter.configure(cell: cell, for: indexPath.row,isFiltering:!searchBarIsEmpty(),collectionView: collectionView)
            
            return cell
        case .smallGrid:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCell", for: indexPath) as! OffersCell
             cell.offerImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
            presenter.configure(cell: cell, for: indexPath.row,isFiltering:!searchBarIsEmpty(),collectionView: collectionView)
            return cell
        }
        
    }
   

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
       return CGSize(width: itemSize  , height: itemSize)
     }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let offersDetailsVC = storyboard?.instantiateViewController(withIdentifier: "OffersDetailsVC") as! OffersDetailsViewController
        offersDetailsVC.modalPresentationStyle = .fullScreen
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
        // Define the menu
       // let menu = SideMenuNavigationController(rootViewController: self)
        // SideMenuNavigationController is a subclass of UINavigationController, so do any additional configuration
        // of it here like setting its viewControllers. If you're using storyboards, you'll want to do something like:
    //    let menu = storyboard!.instantiateViewController(withIdentifier: "RightMenu") as! SideMenuNavigationController
     //   present(menu, animated: true, completion: nil)
        delegate?.togglePane()
    }
}

extension OffersViewController: OffersLayoutDelegate {
  func collectionView(
    _ collectionView: UICollectionView,
    heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
   

    return presenter.offersImagesList.count != 0 ? presenter.offersImagesList[indexPath.item]:0
  
  }
}
