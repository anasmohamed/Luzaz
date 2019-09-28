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
    private let sellYourItemInteractor: SellYourItemInteractor
    private var user: User?
    private var sellItem : Offer?
    init(view: SellYourItemView) {
        self.view = view
        user = User()
        sellItem = Offer()
        sellYourItemInteractor = SellYourItemInteractor()
    }
    
    func setEmail(email : String)  {
        sellItem?.reseller_mail = email
    }
    func setFullName(fullName : String)  {
        sellItem?.reseller_name? = fullName
    }
    func setMobileNumber(mobileNumber : String)  {
        sellItem?.reseller_phone = mobileNumber
    }
    func setItemPrice(price : String)  {
        sellItem?.price = price
    }
    func setItemPriceDiscount(discount : String)  {
        sellItem?.discount_prec = discount
    }
    func setItemCity(cityIndex : Int)  {
        sellItem?.city = String(cityIndex)
    }
    
    func setItemCondition(conditon: String)  {
        sellItem?.condition = conditon
    }
    
    func setItemTitle(title:String)  {
        sellItem?.title = title
    }
    func setItemDescription(descrition: String){
        sellItem?.description = descrition
    }
    func setItemCategory(category : String)  {
        sellItem?.category = category
    }
    func setItemSubCategory(subCategory : String) {
        sellItem?.subCateogry = subCategory
    }
    func setItemBrand(brand : String) {
        sellItem?.brand = brand
    }
    func setOfferImage(image : UIImage)
    {
        sellItem?.offerImage = image
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
    
    func addUserOffer()
    {
        sellYourItemInteractor.addUserOffer(token:UserDefaults.standard.string(forKey: "token")! , privacy_policy: "1", id_governate: (sellItem?.city)!, id_category: (sellItem?.category)!, id_sub_category: (sellItem?.subCateogry)!, attr: "", attr_values: "", title: (sellItem?.title)!, id_brand: (sellItem?.brand)!, offer_type: (sellItem?.condition)!, decription: (sellItem?.description)!, price: (sellItem?.price)!, discount_prec: (sellItem?.discount_prec)!, youtube_link: "", reseller_name: (sellItem?.reseller_name)!, reseller_phone: (sellItem?.reseller_phone)!, reseller_mail: (sellItem?.reseller_mail)!, contact_type: "phone", image:(sellItem?.offerImage)! , album: [nil])
    }
}
