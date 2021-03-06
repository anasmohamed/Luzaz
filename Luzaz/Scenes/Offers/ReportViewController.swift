//
//  ReportViewController.swift
//  Luzaz
//
//  Created by Anas Mohamed on 12/4/19.
//  Copyright © 2019 Luzaz. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController,OfferDetailesView ,MyProductView{
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func getMySellingProductsSuccess() {
        
    }
    
    func getMyOrdersSuccess() {
        
    }
    
    func offerDeletedSuccessfuly(message: String) {
        
    }
    
    func addProductToFavoriteSuccess(message: String) {
        
    }
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error".localiz(), message: error.localiz(), preferredStyle: .alert)
        let action = UIAlertAction(title: "OK".localiz(), style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var cancelBtn: UIButton!
    
    @IBOutlet weak var reportBtn: UIButton!
    @IBOutlet weak var reportView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    var presenter: OfferDetailesPresenter!
    var offerId : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = OfferDetailesPresenter(view :self)
        reportView.layer.cornerRadius = 10
        messageTextView.layer.borderWidth = 0.5
        messageTextView.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func sendReportBtnWasPressed(_ sender: Any) {
        if !titleTextField.text!.isEmpty && !messageTextView.text.isEmpty && !emailTextField.text!.isEmpty {
            presenter.addReportOffer(offer:offerId! , title: titleTextField.text!, message:messageTextView.text, email:emailTextField.text!)
        }else{
            showError(error: "you should enter title , meeage and email".localiz())
        }
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
