//
//  albumImage.swift
//  Luzaz
//
//  Created by Anas Mohamed on 11/16/19.
//  Copyright © 2019 Luzaz. All rights reserved.
//

import Foundation
import SwiftyJSON
class ImagesAlbum {
    var image : String?
    var id : String?
    
      init() {
          
      }
      init(withJson data: JSON) {
          self.image = data["image"].stringValue
          self.id = data["id"].stringValue
         
      
      }
}
