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
        egypt = Country(name: "Egypt",image: "egypt-flag-round-icon-16")
        libya = Country(name: "Libya",image: "libya-flag-round-icon-16")
        USA = Country(name: "USA",image: "united-states-of-america-flag-round-icon-16")
        emirates = Country(name: "Emirates",image: "united-arab-emirates-flag-round-icon-16")
        saudi = Country(name: "Saudi Arabia",image: "saudi-arabia-flag-round-icon-16")
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
