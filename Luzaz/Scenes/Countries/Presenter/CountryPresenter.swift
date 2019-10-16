//
//  LanguagePresenter.swift
//  Luzaz
//
//  Created by jets on 12/21/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
class CountryPresenter {
    
    private weak var view: CountryView?
    private var egypt,libya,USA,emirates,saudi: Country?
    private var countries: [Country]
    
    init(view: CountryView) {
        self.view = view
       
        egypt = Country(name: "Egypt",image: "egypt")
        libya = Country(name: "Libya",image: "libya")
        USA = Country(name: "USA",image: "usa")
        emirates = Country(name: "Emirates",image: "emirates")
        saudi = Country(name: "Saudi Arabia",image: "saudi_arabia")
        countries = [Country]()
    }
    
    func viewDidLoad() {
        getCountries()
    }
    
    func getCountries() {
        countries.append(egypt!)
        countries.append(USA!)
        countries.append(emirates!)
        countries.append(saudi!)
        countries.append(libya!)
    }
    func getCountriesCount() -> Int {
        return countries.count
    }
    
    func configure(cell: CountryTableViewCell, for index: Int) {
        let country = countries[index]
        guard let image = country.image,
            let name = country.name
            else { return }
        
        cell.displayCountryImage(image: image)
        cell.displayCountryName(name: name)
    }
    
}
