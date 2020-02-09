//
//  OffersViewController.swift
//  Luzaz
//
//  Created by Admin on 7/10/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit
import MOLH
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
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
        self.collectionView.register(UINib(nibName: "CollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier:
        "CollectionReusableView")

        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if isLoading {
            return CGSize.zero
        }
        return CGSize(width: collectionView.bounds.size.width, height: 55)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
//    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
               let aFooterView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionReusableView", for: indexPath) as! CollectionReusableView
               self.footerView = aFooterView
               self.footerView?.backgroundColor = UIColor.clear
               return aFooterView
           } else {
               let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:"CollectionReusableView" , for: indexPath)
               return headerView
           }
       }
    
       func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == UICollectionView.elementKindSectionFooter {
               self.footerView?.prepareInitialAnimation()
           }
       }
       
       func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == UICollectionView.elementKindSectionFooter {
               self.footerView?.stopAnimate()
           }
       }
    //compute the scroll value and play witht the threshold to get desired effect
      func scrollViewDidScroll(_ scrollView: UIScrollView) {
          let threshold   = 100.0 ;
          let contentOffset = scrollView.contentOffset.y;
          let contentHeight = scrollView.contentSize.height;
          let diffHeight = contentHeight - contentOffset;
          let frameHeight = scrollView.bounds.size.height;
          var triggerThreshold  = Float((diffHeight - frameHeight))/Float(threshold);
          triggerThreshold   =  min(triggerThreshold, 0.0)
        let pullRatio  = min(abs(triggerThreshold),1.0);
          self.footerView?.setTransform(inTransform: CGAffineTransform.identity, scaleFactor: CGFloat(pullRatio))
          if pullRatio >= 1 {
              self.footerView?.animateFinal()
          }
          print("pullRation:\(pullRatio)")
      }
      
//      //compute the offset and call the load method
//      func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//          let contentOffset = scrollView.contentOffset.y;
//          let contentHeight = scrollView.contentSize.height;
//          let diffHeight = contentHeight - contentOffset;
//          let frameHeight = scrollView.bounds.size.height;
//        let pullHeight  = abs(diffHeight - frameHeight);
//          print("pullHeight:\(pullHeight)");
//          if pullHeight == 0.0
//          {
//              if (self.footerView?.isAnimatingFinal)! {
//                  print("load more trigger")
//                  self.isLoading = true
//                  self.footerView?.startAnimate()
//                  Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (timer:Timer) in
//                      for i:Int in self.items.count + 1...self.items.count + 25 {
//                          self.items.append(i)
//                      }
//                      self.collectionView.reloadData()
//                      self.isLoading = false
//                  })
//              }
//          }
//      }
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
      
        switch layoutOption {
        case .largeGrid:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCell", for: indexPath) as! OffersCell
            
            presenter.configure(cell: cell, for: indexPath.row,isFiltering:!searchBarIsEmpty(),collectionView: collectionView)
            
            return cell
        case .smallGrid:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCell", for: indexPath) as! OffersCell
            presenter.configure(cell: cell, for: indexPath.row,isFiltering:!searchBarIsEmpty(),collectionView: collectionView)
            return cell
        }
        
    }
   
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            if indexPath.item % 2 != 0{
//
//            }
//            let cellsAcross: CGFloat = 3
//            let spaceBetweenCells: CGFloat = 10
//            let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
//            return CGSize(width: dim, height: 300)
//        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
       return CGSize(width: itemSize, height: itemSize)
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
