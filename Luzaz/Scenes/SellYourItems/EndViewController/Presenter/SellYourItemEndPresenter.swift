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
    private var sellItem : Offer?
     
    init(view: SellYourItemView) {
        self.view = view
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
    
    func addUserOffer(token:String,privacy_policy:String,id_governate:String,id_category:String,id_sub_category:String,attr:String,attr_values:String,title:String,id_brand:String,offer_type:String,decription:String,price:String,discount_prec:String,youtube_link:String,reseller_name:String,reseller_phone:String,reseller_mail:String,contact_type:String,image: UIImage,album:[UIImage?])
    {
        sellYourItemInteractor.addUserOffer(token:token , privacy_policy: privacy_policy, id_governate:id_governate, id_category: id_category, id_sub_category: id_sub_category, attr: "", attr_values: "", title: title, id_brand: id_brand, offer_type:offer_type , decription: decription, price: price, discount_prec: discount_prec, youtube_link: "", reseller_name: reseller_name, reseller_phone: reseller_phone, reseller_mail: reseller_mail, contact_type: "phone", image:image, album: [nil])
    }
}
