//
//  PopupImageViewViewController.swift
//  Luzaz
//
//  Created by Anas Mohamed on 4/12/20.
//  Copyright © 2020 Luzaz. All rights reserved.
//

import UIKit
import SDWebImage
class PopupImageViewViewController: UIViewController {

    @IBOutlet weak var popView: UIView!
    var imageURL : String?
    @IBOutlet weak var popupImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        popView.layer.cornerRadius = 10
        popView.layer.masksToBounds = true
        popupImageView.sd_setImage(with:URL(string:"http://luzaz.com/upload/\(imageURL!)"))
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
