//
//  SellYourItemEndPresenter.swift
//  Luzaz
//
//  Created by jets on 1/5/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import UIKit
class SellYourItemPresenter {
    private weak var view: SellYourItemView?
    private weak var firstView: SellYourItemFirstView?
    private weak var secondView: SellYourItemSecondView?
    private let sellYourItemInteractor: SellYourItemInteractor?
    private var sellItem : Offer?
    private var governorates : [Governorates]?
    private var gategories : [Category]?
    private var brands : [Brands]?
    
    init(view: SellYourItemView) {
        self.view = view
        sellItem = Offer()
        governorates = [Governorates]()
        sellYourItemInteractor = SellYourItemInteractor()
    }
    init(view:SellYourItemSecondView ) {
        self.secondView = view
        brands = [Brands]()
        sellYourItemInteractor = SellYourItemInteractor()
        
    }
    init(view:SellYourItemFirstView) {
        self.firstView = view
        sellYourItemInteractor = SellYourItemInteractor()
        governorates = [Governorates]()
        
    }
    func setAppartmentArea(area : String)  {
        sellItem?.appartment.area = area
    }
    func setAppartmentLevels(levels : String)  {
        sellItem?.appartment.levels = levels
    }
    func setAppartmentBedrooms(bedrooms: String)  {
        sellItem?.appartment.bedrooms = bedrooms
    }
    func setAppartmentBathrooms(bathrooms: String)  {
        sellItem?.appartment.bathrooms = bathrooms
    }
    func setAppartmentFinish(finish : String) {
        sellItem?.appartment.finished = finish
    }
    func getOfferCity()->String
    {
        return (sellItem?.city)!
    }
    func getAppartmentBedrooms()-> String
    {
        return (sellItem?.appartment.bedrooms)!
    }
    func getItemBrand() -> String {
        return (sellItem?.brand)!
    }
    func  viewDidLoad()  {
        //getGovernorates(country:UserDefaults.standard.string(forKey: "country")!)
    }
    
    func getBrands(gategory: String)
    {
        secondView?.showIndicator()
        sellYourItemInteractor?.getBrands(gategory: gategory) { [unowned self] (brands, error) in
            self.secondView?.hideIndicator()
            
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let brands = brands else { return }
                self.brands = brands
                if !brands.isEmpty{
                self.secondView?.getBrandsSuccess()
                }else{
                    self.secondView?.getBrandsEmpty()
                }
            }
        }
    }
    
    func getGovernorates(country: String)
    {
        firstView?.showIndicator()
        sellYourItemInteractor?.getGovernorates(country: country) {
            [unowned self] (governorates, error) in
            self.firstView?.hideIndicator()
            
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                guard let governorates = governorates else { return }
                self.governorates = governorates
                self.firstView?.getGovernoratesSuccess()
            }
        }
        
        
    }
    func getBrandsCount() ->Int  {
        return (brands?.count)!
    }
    func  getBrandsId(row:Int) -> String {
        return brands![row].id!
    }
    func getBrandsNams(row: Int) -> String {
        return brands![row].name!
    }
    func getGovernoratesCount() ->Int {
        return (governorates?.count)!
    }
    func getGovernoratesName(row : Int) -> String  {
        return governorates![row].name!
    }
    func getGovernoratesId(row: Int)-> String
    {
        return governorates![row].id!
        
    }
    func addUserOffer(token:String,privacy_policy:String,id_governate:String,id_category:String,id_sub_category:String,attr:String,attr_values:String,title:String,id_brand:String,offer_type:String,decription:String,price:String,discount_prec:String,youtube_link:String,reseller_name:String,reseller_phone:String,reseller_mail:String,contact_type:String,image: UIImage,album:[UIImage?],lat:String,long : String)
    {
        sellYourItemInteractor?.addUserOffer(token:token , privacy_policy: privacy_policy, id_governate:"45", id_category: id_category, id_sub_category: id_sub_category, attr: "", attr_values: "", title: title, id_brand: id_brand, offer_type:offer_type , decription: decription, price: price, discount_prec: discount_prec, youtube_link: "", reseller_name: reseller_name, reseller_phone: reseller_phone, reseller_mail: reseller_mail, contact_type: contact_type, image: UIImage(named: "back-arrow")!, album: [nil],lat:lat,long:long)
    }
}
