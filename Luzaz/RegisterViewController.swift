//
//  RegisterViewController.swift
//  Luzaz
//
//  Created by jets on 12/1/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var conPassTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    var parameters: Parameters = [
        :]
    
    @IBAction func registerBtn(_ sender: UITextField) {
//        parameters["country_id"] = "1"
//        parameters["name"] = String(describing: userNameTextField.text!)
//        parameters["phone"] = String(describing: mobileTextField.text!)
//        parameters["mail"] = String(describing: emailTextField.text!)
//        parameters["password"] = String(describing: passwordTextField.text!)
//        parameters["re_password"] = String(describing: conPassTextField.text!)
//        Alamofire.request("http://api.luzaz.com/ar/mobile/register",method:.post,parameters:parameters,encoding:URLEncoding.queryString,headers:nil).responseJSON { (response) in
//            print(response.request)
//            print(response.request?.httpBody)
//            if let responseValue = response.result.value as! [String: Any]? {
//                print("response is :\(responseValue["code"])")
//                let code = responseValue["code"]
//                if String(describing: code) != "0"
//                {
//                    let alert = UIAlertController(title: "Error", message: "You Did Somthing Wrong", preferredStyle: .alert)
//                    
//                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                    
//                    self.present(alert, animated: true)
//                    
//                }else{
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeMainCat") as! HomeandMainCatViewController
//                self.present(vc, animated: true, completion: nil)
//                }
//                
//            }
//        }
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
    }
    override func viewDidAppear(_ animated: Bool) {
        scroller.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+900)
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
