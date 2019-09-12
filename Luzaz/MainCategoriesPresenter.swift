//
//  MainCategoriesPresenter.swift
//  Luzaz
//
//  Created by jets on 1/11/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
class MainCategoriesPresenter {
    private weak var view: MainCategoriesView?
    private let mainCategoriesInteractor: MainCategoriesInteractor
    private var category: Offer?
    private var categories: [Category]
    private var filteredCategories : [Category]
    init(view: MainCategoriesView) {
        self.view = view
        mainCategoriesInteractor = MainCategoriesInteractor()
        categories = [Category]()
        filteredCategories = categories
    }
    
    func viewDidLoad() {
        
       
        getMainCategories()
        
    }
    
    func getMainCategories() {
        view?.showIndicator()
        mainCategoriesInteractor.getMainCategories() { [unowned self] (categories, error) in
            
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let categories = categories else { return }
                self.categories = categories
                self.filteredCategories = categories
                self.view?.getMainCategoriesSuccess()
            }
        }
    }
    func getMainCategoriesCount() -> Int {
        return categories.count
    }
    func getFilteredMainCategoriesCount() -> Int {
        return filteredCategories.count
    }
    func getSearchedCategories(searchText : String) {
        filteredCategories =  categories.filter({( category : Category) -> Bool in
            return (category.name?.lowercased().contains(searchText.lowercased()))!
        })
        
        
    }
    
    func configure(cell: MainCategoriesCellView, for index: Int,isFiltering : Bool) {
        let category : Category
        if isFiltering {
            category = filteredCategories[index]
        }else{
            category = categories[index]
        }
        guard let name = category.name
            else { return }

        cell.displayMainCategoriesImage(mainCategoriesImage:name )
    }
    func pushToDetails(viewController : SubCategoriesViewController, _ index : Int) {
        viewController.mainCategoryId = categories[index].id
    }
 
}
