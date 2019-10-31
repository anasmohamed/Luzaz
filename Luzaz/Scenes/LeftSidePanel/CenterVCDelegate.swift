//
//  CenterVCDelegate.swift
//  Luzaz
//
//  Created by jets on 12/18/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
protocol CenterVCDelegate {
    func togglePane()
    func toggleLeftPane()
    func toggleRightPane()
    func addLeftPanelViewController()
    func animateLeftPanel(shouldExpand : Bool)
}
