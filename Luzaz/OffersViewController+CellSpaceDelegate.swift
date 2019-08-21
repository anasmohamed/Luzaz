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
        return 0.0
    }
    

    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
