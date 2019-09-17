//
//  OffersDetailsViewController.swift
//  Luzaz
//
//  Created by jets on 12/17/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import UIKit
import SDWebImage
import FaveButton

func color(_ rgbColor: Int) -> UIColor{
    return UIColor(
        red:   CGFloat((rgbColor & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbColor & 0x00FF00) >> 8 ) / 255.0,
        blue:  CGFloat((rgbColor & 0x0000FF) >> 0 ) / 255.0,
        alpha: CGFloat(1.0)
    )
}

class OffersDetailsViewController: UIViewController,OfferDetailesView,FaveButtonDelegate{
    var offer : Offer!
    @IBOutlet var heartButton: FaveButton?

    @IBOutlet weak var offerDescriptionLabel: UILabel!
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var offerTitleLabel: UILabel!
    @IBOutlet weak var offerImageView: UIImageView!
    var presenter: OfferDetailesPresenter!
    var token : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.heartButton?.setSelected(selected: true, animated: false)

        print("desci\(offer.description!)")
        presenter = OfferDetailesPresenter(view: self)
        offerImageView.sd_setImage(with: URL(string: "http://luzaz.com/upload/\(offer.image!)"), placeholderImage: UIImage(named: "back.png"))
        offerTitleLabel.text = offer.title!
        offerDescriptionLabel.text = offer.description!
//        scroller.translatesAutoresizingMaskIntoConstraints = false
//        scroller.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        scroller.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        scroller.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        scroller.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        token = UserDefaults.standard.string(forKey: "token")!
        // Do any additional setup after loading the view.
    }
    
    let colors = [
        DotColors(first: color(0x7DC2F4), second: color(0xE2264D)),
        DotColors(first: color(0xF8CC61), second: color(0x9BDFBA)),
        DotColors(first: color(0xAF90F4), second: color(0x90D1F9)),
        DotColors(first: color(0xE9A966), second: color(0xF8C852)),
        DotColors(first: color(0xF68FA7), second: color(0xF6A2B8))
    ]
    func faveButtonDotColors(_ faveButton: FaveButton) -> [DotColors]?{
        if( faveButton === heartButton ){
            return colors
        }
        return nil
    }
    @IBAction func addProductToFavoriteBtnWasPressed(_ sender: Any) {
       
    }
    func faveButton(_ faveButton: FaveButton, didSelected selected: Bool) {
         presenter.addProductToFavorite(token:token! , offerId:offer.offerId!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        scroller.contentSize = CGSize(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height - 70) + offerDescriptionLabel.bounds.size.height)
    }
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    func addProductToFavoriteSuccess(message: String) {
        let alertController = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
