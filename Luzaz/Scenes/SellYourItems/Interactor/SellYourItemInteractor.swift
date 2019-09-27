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
    func addUserOffer(token:String,privacy_policy:String,id_governate:String,id_category:String,id_sub_category:String,attr:String,attr_values:String,title:String,id_brand:String,offer_type:String,decription:String,price:String,discount_prec:String,youtube_link:String,reseller_name:String,reseller_phone:String,reseller_mail:String,contact_type:String,image: UIImage,album:[UIImage])
    {
        
        
        let pageUrl = NetworkingConstants.baseURL + NetworkingConstants.addUserOffer
        var parameters = [
            "id": "2",
            ]
        
        
        // add addtionial parameters
        
        
        
        parameters["heading"] = "Veenaay Heading"
        parameters["warranty"] = "12"
        parameters["warranty_type"] = "Y"
        
        parameters["price"] = "22.00"
        parameters["currency"] = "EUR"
        parameters["date_time"] = "2017-12-30"
        parameters["description"] = "this is test entry"
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
}
