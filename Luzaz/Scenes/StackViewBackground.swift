//
//  StackViewBackground.swift
//  Luzaz
//
//  Created by Anas Mohamed on 10/15/19.
//  Copyright © 2019 Luzaz. All rights reserved.
//

import Foundation
import UIKit
extension UIStackView {
    func addBackground(color: UIColor) {
        let backgroundLayer = CAShapeLayer()
        self.layer.insertSublayer(backgroundLayer, at: 0)
        backgroundLayer.path = UIBezierPath(rect :self.bounds).cgPath
        backgroundLayer.fillColor = color.cgColor
    }
}
