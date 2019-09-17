//
//  FavImage.swift
//  Luzaz
//
//  Created by jets on 1/17/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit

// MARK: - UIImage extension
extension UIImage {
    convenience init!(assetName: ImageAsset) {
        self.init(named: assetName.rawValue)
    }
}

// MARK: - ImageAsset
enum ImageAsset: String {
    case star = "star"
    
    var image: UIImage {
        return UIImage(named: self.rawValue)!
    }
}
