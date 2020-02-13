//
//  OffersViewController+CellSpaceDelegate.swift
//  Luzaz
//
//  Created by jets on 12/19/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import UIKit
extension OffersViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (indexPath.row == presenter.getOffersCount() - 1 &&  !presenter.isOfferEmpty) { //it's your last cell
            pageNumber += 1
            presenter.getOffers(countryId:countryId ?? "1" ,page: String(pageNumber))
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.presenter.isOfferEmpty = true
            }
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}
