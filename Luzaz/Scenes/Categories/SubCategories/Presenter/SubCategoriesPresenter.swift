//
//  SubCategoriesPresenter.swift
//  Luzaz
//
//  Created by jets on 1/12/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import UIKit
class SubCategoriesPresenter {
    private weak var view: SubCategoriesView?
    private let subCategoriesInteractor: SubCategoriesInteractor!
    private var subCategories: [Category]
    var language : String?
    init(view: SubCategoriesView) {
        self.view = view
        subCategoriesInteractor = SubCategoriesInteractor()
        subCategories = [Category]()
    }
    
    func viewDidLoad(mainCategoryId : String) {
        language = UserDefaults.standard.string(forKey: "language")

        getSubCategories(mainCategoryId:mainCategoryId)
    }
    
    func getSubCategories(mainCategoryId : String) {
        view?.showIndicator()
        subCategoriesInteractor.getSubCategories(mainCategoryId: mainCategoryId) { [unowned self] (subCategories, error) in
            
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let subCategories = subCategories else { return }
                self.subCategories = subCategories
               
                    self.view?.getSubCategoriesSuccess()

                
            }
        }
    }
    func getSubCategoriesCount() -> Int {
        return subCategories.count
    }
    
    func getSubCategoriesName(row: Int)->String
    {
        return subCategories[row].name!
    }
    
    func getSubCategoriesId(row: Int)->String
    {
        return subCategories[row].id!
    }
    
    func configure(cell: UITableViewCell, for index: Int) {
        let category = subCategories[index]
        if language == "en" {
        cell.textLabel?.text =  category.nameEng
        }else
        {
            cell.textLabel?.textAlignment = .right

            cell.textLabel?.text =  category.name

        }
        
    }
    func pushToDetails(viewController : SubCategoryOffersViewController, _ subCategoryId : String) {
        viewController.subCategoryId = subCategoryId
        
    }

}
