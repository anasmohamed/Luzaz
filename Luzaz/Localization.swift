//
//  Locliztion.swift
//  Luzaz
//
//  Created by Anas Mohamed on 12/24/19.
//  Copyright © 2019 Luzaz. All rights reserved.
//

import Foundation
import UIKit

public extension String

{
    func localiz(comment: String = "") ->String
    {
        return NSLocalizedString(self, comment: comment)
    }
    
}
