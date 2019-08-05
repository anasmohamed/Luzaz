//
//  LoginViewController.swift
//  Luzaz
//
//  Created by Salwa on 4/30/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var scroller: UIScrollView!
    @IBAction func loginBtn(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        scroller.translatesAutoresizingMaskIntoConstraints = false
        scroller.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scroller.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scroller.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scroller.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
       // override func viewDidAppear(_ animated: Bool) {
       //     var newSafeArea = UIEdgeInsets()
            // Adjust the safe area to accommodate
            //  the width of the side view.
        //    if let sideViewWidth = sideView?.bounds.size.width {
        //        newSafeArea.right += sideViewWidth
         //   }
            // Adjust the safe area to accommodate
            //  the height of the bottom view.
        //    if let bottomViewHeight = bottomView?.bounds.size.height {
         //       newSafeArea.bottom += bottomViewHeight
          //  }
            // Adjust the safe area insets of the
            //  embedded child view controller.
        //    let child = self.childViewControllers[0]
         //   child.additionalSafeAreaInsets = newSafeArea
        //}
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
