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
    @IBOutlet weak var collectionView: UICollectionView!
    var delegate : CenterVCDelegate?
    
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        presenter = OffersPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad()
    }
    
    
    func setupCollectionView() {
        collectionView.register(UINib(nibName: "OffersCell", bundle: nil), forCellWithReuseIdentifier: "OffersCell")
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getOffersCount()
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCell", for: indexPath) as! OffersCell

        presenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let kWhateverHeightYouWant = collectionView.bounds.size.height/2
        return CGSize(width: (collectionView.bounds.size.width/2 - CGFloat(15)), height: CGFloat(kWhateverHeightYouWant - 63))
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
