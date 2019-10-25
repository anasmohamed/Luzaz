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
    @IBOutlet weak var sellerNameLbl: UILabel!
    @IBOutlet weak var addToChatBtn: UIButton!
    @IBOutlet weak var callBtn: UIButton!
    @IBOutlet weak var offerDescriptionLabel: UILabel!
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var offerTitleLabel: UILabel!
    @IBOutlet weak var offerImageView: UIImageView!
    var presenter: OfferDetailesPresenter!
    var token : String?
    
    @IBOutlet weak var offerFavotriteBtn: FaveButton!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.heartButton?.setSelected(selected: true, animated: false)
        imageLable()
        print("desci\(offer.description!)")
        presenter = OfferDetailesPresenter(view: self)
        offerImageView.sd_setImage(with: URL(string: "http://luzaz.com/upload/\(offer.image!)"), placeholderImage: UIImage(named: "back.png"))
        offerTitleLabel.text = offer.title!
        offerDescriptionLabel.text = offer.description!
        dateLbl.text = offer.date
        locationLbl.text = offer.governorate
        if ((UserDefaults.standard.string(forKey: "token")) != nil)
        {
          token =  UserDefaults.standard.string(forKey: "token")!
            offerFavotriteBtn.isHidden = false
            
        }
        else
        {
            token = ""
            offerFavotriteBtn.isHidden = false

        }
        if offer.contactType == "1"
        {
            callBtn.isHidden = true
        }
        
        // Do any additional setup after loading the view.
    }
   
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
    
    @IBAction func addToFavorite(_ sender: Any) {
        presenter.addProductToFavorite(token:token! , offerId:offer.offerId!)
    }
    func faveButton(_ faveButton: FaveButton, didSelected selected: Bool) {
        presenter.addProductToFavorite(token:token! , offerId:offer.offerId!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scroller.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+100)
//        contentView.size.height = UIScreen.main.bounds.height+offerDescriptionLabel.frame.height + 100
        sellerNameLbl.text = offer.reseller_name
        
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
    
    func imageLable()
    {
        let imageAttachment =  NSTextAttachment()
        imageAttachment.image = UIImage(named:"Calander Icon")
        //Set bound to reposition
        let imageOffsetY:CGFloat = 8.0;
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: 20, height: 20)
        //Create string with attachment
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        //Initialize mutable string
        let completeText = NSMutableAttributedString(string: "")
        //Add image to mutable string
        completeText.append(attachmentString)
        //Add your text to mutable string
        let  textAfterIcon = NSMutableAttributedString(string: "Using attachment.bounds!")
        completeText.append(textAfterIcon)
        self.dateLbl.textAlignment = .left;
        self.dateLbl.attributedText = completeText;
    }
    
    
    @IBAction func chatWithSellerBtnWasPressed(_ sender: Any) {
        let conversationVC = storyboard?.instantiateViewController(withIdentifier: "ConverstionVC") as! ConverstionViewController
        conversationVC.id = offer.reseller_id
        conversationVC.modalPresentationStyle = .fullScreen
        self.present(conversationVC, animated: true, completion: nil)
        
    }
    
    @IBAction func callBtnWasPressed(_ sender: Any) {
        
        print("anas")

        makePhoneCall(phoneNumber: offer.reseller_phone!)
//           UIApplication.shared.canOpenURL(url) {
//              if #available(iOS 10, *) {
//                UIApplication.shared.open(url, options: [:], completionHandler:nil)
//               } else {
//                   UIApplication.shared.openURL(url)
//               }
//           } else {
//                    // add error message here
//           }
//        }
//
    }
      func makePhoneCall(phoneNumber: String) {

              if let phoneURL = NSURL(string: ("tel://" + phoneNumber)) {

                  let alert = UIAlertController(title: ("Call " + phoneNumber + "?"), message: nil, preferredStyle: .alert)
                  alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
                      UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
                  }))

                  alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                  self.present(alert, animated: true, completion: nil)
              }
          }
//        if let url = URL(string: "tel://\(String(describing: offer.reseller_phone))"), UIApplication.shared.canOpenURL(url) {
//            if #available(iOS 10, *) {
//                UIApplication.shared.open(url)
//            } else {
//                UIApplication.shared.openURL(url)
//            }
//        }
//    }
        //    @IBAction func callBtnWasPressed(_ sender: Any) {
        //        print("anas")
        //        if let url = URL(string: "tel://\(offer.reseller_phone)"), UIApplication.shared.canOpenURL(url) {
        //            if #available(iOS 10, *) {
        //                UIApplication.shared.open(url)
        //            } else {
        //                UIApplication.shared.openURL(url)
        //            }
        //    }
        
        //       }
}
