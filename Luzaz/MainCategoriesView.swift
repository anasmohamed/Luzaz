//
//  MainCategoriesView.swift
//  Luzaz
//
//  Created by jets on 1/11/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
protocol MainCategoriesView:class {
    func showIndicator()
    func hideIndicator()
    func getMainCategoriesSuccess()
    func showError(error: String)
}
