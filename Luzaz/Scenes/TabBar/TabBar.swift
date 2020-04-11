//
//  TabBar.swift
//  Luzaz
//
//  Created by Anas Mohamed on 4/11/20.
//  Copyright © 2020 Luzaz. All rights reserved.
//

import UIKit

class TabBar: UIView {

  let nibName = "TabBar"
    @IBOutlet weak var homeBtn: UIButton!
    
    @IBOutlet weak var categoryBtn: UIButton!
    @IBOutlet weak var myProductBtn: UIButton!
    @IBOutlet weak var sellYourItemsBtn: UIButton!
    @IBOutlet weak var profileBtn: UIButton!
    @IBAction func categoryBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func myProductBtnWasPressed(_ sender: Any) {
    }
    @IBAction func sellYourItemWasPressed(_ sender: Any) {
    }
    
    @IBAction func profileBtnWasPressed(_ sender: Any) {
    }
    @IBAction func homeBtnWasPressed(_ sender: Any) {
    }
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         commonInit()
     }
     
     override init(frame: CGRect) {
         super.init(frame: frame)
         commonInit()
     }
     
     func commonInit() {
         guard let view = loadViewFromNib() else { return }
         view.frame = bounds
         addSubview(view)
     }
     
     func loadViewFromNib() -> UIView? {
         let nib = UINib(nibName: nibName, bundle: nil)
         return nib.instantiate(withOwner: self, options: nil).first as? UIView
     }

}
