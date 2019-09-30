//
//  RoundButton.swift
//  Luzaz
//
//  Created by jets on 1/30/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit
@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var cornerRedius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRedius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
