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
        if (indexPath.row == presenter.getOffersCount() - 1 && pageNumber < 25) { //it's your last cell
            pageNumber += 1
            presenter.getOffers(countryId:countryId ?? "1" ,page: String(pageNumber))
           DispatchQueue.global().async {
                           // Fake background loading task for 2 seconds
                           sleep(2)
                           // Download more data here
                           DispatchQueue.main.async {
                               self.collectionView.reloadData()
                           }
                       }
         }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}
