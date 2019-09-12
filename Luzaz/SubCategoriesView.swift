//
//  SubCategoriesView.swift
//  Luzaz
//
//  Created by jets on 1/12/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
protocol  SubCategoriesView:class{
    func showIndicator()
    func hideIndicator()
    func getSubCategoriesSuccess()
    func showError(error: String)
}
