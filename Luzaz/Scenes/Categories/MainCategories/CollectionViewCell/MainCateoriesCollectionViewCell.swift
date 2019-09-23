//
//  MainCateoriesCollectionViewCell.swift
//  Luzaz
//
//  Created by jets on 1/11/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit

class MainCateoriesCollectionViewCell: UICollectionViewCell,MainCategoriesCellView {

    @IBOutlet weak var mainCategoryImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func displayMainCategoriesImage(mainCategoriesImage: String) {
        print("the name \(mainCategoriesImage)")
    }
}
