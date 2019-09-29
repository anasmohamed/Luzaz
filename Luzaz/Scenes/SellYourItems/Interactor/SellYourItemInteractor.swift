//
//  SellYourItemInteractor.swift
//  Luzaz
//
//  Created by jets on 1/1/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class SellYourItemInteractor {
    func addUserOffer(token:String,privacy_policy:String,id_governate:String,id_category:String,id_sub_category:String,attr:String,attr_values:String,title:String,id_brand:String,offer_type:String,decription:String,price:String,discount_prec:String,youtube_link:String,reseller_name:String,reseller_phone:String,reseller_mail:String,contact_type:String,image: UIImage,album:[UIImage?])
    {
        
        
        let pageUrl = NetworkingConstants.baseURL + NetworkingConstants.addUserOffer
        var parameters = [NetworkingConstants.addUserOfferToken: token]
        
        
        // add addtionial parameters
        
        
        
        parameters[NetworkingConstants.addUserOfferPrivacyPolicy] = privacy_policy
        parameters[NetworkingConstants.addUserOfferIdGovernate] = id_governate
        parameters[NetworkingConstants.addUserOfferIdCategory] = id_category
        
        parameters[NetworkingConstants.addUserOfferIdSubCategory] = id_sub_category
        parameters[NetworkingConstants.addUserOfferAttr] = attr
        parameters[NetworkingConstants.addUserOfferAttrValues] = attr_values
        parameters[NetworkingConstants.addUserOfferTitle] = title
        parameters[NetworkingConstants.addUserOfferIdBrand] = id_brand
        parameters[NetworkingConstants.addUserOfferOfferType] = offer_type
        parameters[NetworkingConstants.addUserOfferDecription] = decription
        
        parameters[NetworkingConstants.addUserOfferPrice] = price
        parameters[NetworkingConstants.discount_prec] = discount_prec
        parameters[NetworkingConstants.addUserOfferYoutubeLink] = youtube_link
        parameters[NetworkingConstants.addUserOfferReseller_name] = reseller_name
        
        parameters[NetworkingConstants.addUserOfferReseller_phone]  = reseller_phone
        parameters[NetworkingConstants.addUserOfferReseller_mail] = reseller_mail
        parameters[NetworkingConstants.addUserOfferContact_type] = contact_type
        let imageData = UIImagePNGRepresentation(image)
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in parameters {
                multipartFormData.append(value.data(using: .utf8)!, withName: key)
            }
            
            multipartFormData.append(imageData!, withName: "image", fileName: "offer_image.jpeg", mimeType: "image/jpeg")
        }, to: pageUrl)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    //self.delegate?.showSuccessAlert()
                    print(response.request)  // original URL request
                    print(response.response) // URL response
                    print(response.data)     // server data
                    print(response.result)   // result of response serialization
                    //                        self.showSuccesAlert()
                    //self.removeImage("frame", fileExtension: "txt")
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                    }
                }
                
            case .failure(let encodingError):
                //self.delegate?.showFailAlert()
                print(encodingError)
            }
            
        }    }
    
    func getGovernorates(country: String,
                         completionHandler: @escaping ([Governorates]?, Error?) -> Void) {
        Alamofire.request(LuzazRouter.getGovernorates(country: country)).responseJSON {(response) in
            
            if let response = response.data {
                print("Response Data: \(response)")
            } else {
                print("Response Data: nil")
            }
            if let request = response.request {
                print("Request Request: \(request)")
                print("Request Description: \(request.description)")
                print("Request Debug Description: \(request.debugDescription)")
                
                print("Response Request HTTP method: \(request.httpMethod!)")
                //                print("Response Request Content-Type: \(request.value(forHTTPHeaderField: NetworkingConstants.contentType)!)")
            } else {
                print("Response Request: nil")
            }
            
            if let responseStatusCode = response.response {
                print("Response Status Code: \(responseStatusCode.statusCode)")
            } else {
                print("Response Status Code: nil")
            }
            
            if let error = response.error {
                print("Response Error Code: \(error.localizedDescription)")
            } else {
                print("Response Error Code: nil")
            }
            
            
            let result = response.result
            switch result {
            case .success :
                let json = JSON(result.value!)
                print(json)
                var governoratesList = [Governorates]()
                let governorates = json["data"].arrayValue
                for governorate in governorates
                {
                    let data = Governorates(withJSON:governorate)
                    governoratesList.append(data)
                }
                completionHandler(governoratesList, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
    }
    func getBrands(gategory: String,
                         completionHandler: @escaping ([Brands]?, Error?) -> Void) {
        Alamofire.request(LuzazRouter.getBrands(gategory:gategory)).responseJSON {(response) in
            
            if let response = response.data {
                print("Response Data: \(response)")
            } else {
                print("Response Data: nil")
            }
            if let request = response.request {
                print("Request Request: \(request)")
                print("Request Description: \(request.description)")
                print("Request Debug Description: \(request.debugDescription)")
                
                print("Response Request HTTP method: \(request.httpMethod!)")
                //                print("Response Request Content-Type: \(request.value(forHTTPHeaderField: NetworkingConstants.contentType)!)")
            } else {
                print("Response Request: nil")
            }
            
            if let responseStatusCode = response.response {
                print("Response Status Code: \(responseStatusCode.statusCode)")
            } else {
                print("Response Status Code: nil")
            }
            
            if let error = response.error {
                print("Response Error Code: \(error.localizedDescription)")
            } else {
                print("Response Error Code: nil")
            }
            
            
            let result = response.result
            switch result {
            case .success :
                let json = JSON(result.value!)
                print(json)
                var brandsList = [Brands]()
                let brands = json["data"].arrayValue
                for brand in brands
                {
                    let data = Brands(withJson:brand)
                    brandsList.append(data)
                }
                completionHandler(brandsList, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
    }

}
