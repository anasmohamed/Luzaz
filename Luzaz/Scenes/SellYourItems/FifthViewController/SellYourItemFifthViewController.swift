//
//  SellYourItemFifthViewController.swift
//  Luzaz
//
//  Created by Admin on 8/1/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit

class SellYourItemFifthViewController: UIViewController , SellYourItemFifthView{
    @IBOutlet weak var priceTextView: UITextField!

    @IBOutlet weak var discountTextView: UITextField!
    var presenter : SellYourItemFifthPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SellYourItemFifthPresenter(view: self)
    }
 
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if !(priceTextView.text?.isEmpty)! {
            presenter.setItemPrice(price: priceTextView.text!)
            presenter.setItemPriceDiscount(discount: discountTextView.text!)
            let sellYourItemSecondVC = storyboard?.instantiateViewController(withIdentifier:"SellYourItemEndVC")as! SellYourItemEndViewController
            self.present(sellYourItemSecondVC,animated:true,completion: nil)
        }else{
            showError(error: "You Should Enter Price")
        }
    }
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }

}
