//
//  SellYourItemViewController.swift
//  Luzaz
//
//  Created by Salwa on 5/1/18.
//  Copyright © 2018 Luzaz. All rights reserved.
//

import UIKit
import OpalImagePicker
import SDWebImage

protocol ImageDeletable {
   func deleteImage(imageId: String)
}
class SellYourItemViewController: UIViewController ,UINavigationControllerDelegate,SellYourItemFirstView,OpalImagePickerControllerDelegate{
    
    @IBOutlet weak var sellectdOfferImagesCollectionView: UICollectionView!
    internal func showIndicator() {
        spinner.startAnimating()
    }
    func hideIndicator() {
        spinner.stopAnimating()
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var cityPickerView: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    var imagePicker = OpalImagePickerController()
    var presenter : SellYourItemPresenter!
    var isCityEntered = false
    var cityIndex : String?
    var isEditProduct : Bool = false
    var offerImage: UIImage?
    var offerAlbum = [UIImage]()
    var updatedOfferImage : UIImage?
    var isUpdateOfferImage: Bool = false
    var isPhotoChoosen = false
    var cityName : String?
    var incomeImage : String?
    var incomeBrand :String?
    var incomeCategory:String?
    var incomeSubCategory :String?
    var incomeCodition:String?
    var incomeDiscription :String?
    var incomeYoutubelink:String?
    var incomeTitle:String?
    var incomePrice :String?
    var incomeDiscount:String?
    var incomeSellerName:String?
    var incomeSellerPhone:String?
    var incomeSellerMail:String?
    var incomeOfferId:String?
    var token : String?
    let lblNew = UILabel()

    @IBOutlet weak var nextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        cityPickerView.dataSource = self
        cityPickerView.delegate = self
        //setupCollectionView()
        token = UserDefaults.standard.string(forKey: "token")!
        presenter = SellYourItemPresenter(view: self)
        imagePicker.maximumSelectionsAllowed = 5
        imagePicker.imagePickerDelegate = self
        sellectdOfferImagesCollectionView.delegate = self
        sellectdOfferImagesCollectionView.dataSource = self
        sellectdOfferImagesCollectionView.layer.borderWidth = 1
        sellectdOfferImagesCollectionView.layer.borderColor = UIColor.black.cgColor

        self.hideKeyboardWhenTappedAround()
        if isEditProduct
        {
            imageView.sd_setImage(with: URL(string: "http://luzaz.com/upload/\(incomeImage ?? "")"))
            textToImage(drawText: "change photo", atPoint:CGPoint( x: 0,y: imageView.frame.origin.y + 60))
            let offerImageGestuer = UITapGestureRecognizer(target: self, action: #selector(changeOfferImage))
            imageView.addGestureRecognizer(offerImageGestuer)
            offerImageGestuer.numberOfTouchesRequired = 1
            
        }
        
    }
    func setupCollectionView()
    {
        sellectdOfferImagesCollectionView.register(UINib(nibName: "OfferImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OfferImageCollectionViewCell")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidLoad()
    }
    @objc func changeOfferImage()
    {
        imagePicker.maximumSelectionsAllowed = 1
        present(imagePicker, animated: true, completion: nil)

        isUpdateOfferImage = true
        
    }
    @IBAction func nextButtonWasPressed(_ sender: Any) {
        if isCityEntered && isPhotoChoosen
        {
            let sellYourItemSecondVC = storyboard?.instantiateViewController(withIdentifier:"SellYourItemSecondVC")as! SellYourItemSecondViewController
            sellYourItemSecondVC.city = cityIndex
            sellYourItemSecondVC.offerImage = offerImage
            sellYourItemSecondVC.isEditProduct = isEditProduct
            sellYourItemSecondVC.offerAlbum = offerAlbum
            if isEditProduct{
                sellYourItemSecondVC.incomeBrand = incomeBrand
                sellYourItemSecondVC.incomePrice = incomePrice
                sellYourItemSecondVC.incomeTitle = incomeTitle
                sellYourItemSecondVC.incomeCategory = incomeCategory
                sellYourItemSecondVC.incomeCodition = incomeCodition
                sellYourItemSecondVC.incomeDiscount = incomeDiscount
                sellYourItemSecondVC.incomeSellerMail = incomeSellerMail
                sellYourItemSecondVC.incomeSellerName = incomeSellerName
                sellYourItemSecondVC.incomeSellerPhone = incomeSellerPhone
                sellYourItemSecondVC.incomeDiscription = incomeDiscription
                sellYourItemSecondVC.incomeYoutubelink = incomeYoutubelink
                sellYourItemSecondVC.incomeSubCategory = incomeSubCategory
                
                sellYourItemSecondVC.isEditProduct = isEditProduct
                
            }
            sellYourItemSecondVC.modalPresentationStyle = .fullScreen
            self.present(sellYourItemSecondVC,animated:true,completion: nil)
            
        }else
        {
            showError(error: "you must choose city and photo")
        }
        
    }
    func getGovernoratesSuccess() {
        cityPickerView.reloadAllComponents()
    }
    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingImages images: [UIImage])
    {
        
        if isUpdateOfferImage
        {
            updatedOfferImage  = images[0]
            isPhotoChoosen = true

            imagePicker.dismiss(animated: true, completion: nil)

            presenter.updateOfferImage(token: token!, offferId:incomeOfferId!,image: updatedOfferImage!)
        }else{
        offerImage = images[0]
        imageView.image = images[0]
            
        offerAlbum = Array(images[1..<images.count])
            sellectdOfferImagesCollectionView.reloadData()
        isPhotoChoosen = true
        imagePicker.dismiss(animated: true, completion: nil)
        }
        
    }
    func imagePickerDidCancel(_ picker: OpalImagePickerController)
    {
        isPhotoChoosen = false
        
    }
    @IBAction func selectPhotoBtnWasPressed(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
        
    }
    func showError(error : String)
    {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
    
    

    // Add text to image
    func textToImage(drawText text: NSString, atPoint point: CGPoint) {

        lblNew.frame = CGRect(x: point.x, y: point.y, width: 203.0, height: 30)
        lblNew.textAlignment = .center
        lblNew.text = text as String
        lblNew.textColor = UIColor.white
        lblNew.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5)
        imageView.addSubview(lblNew)
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
          dismiss(animated: true, completion: nil)
    }
    
}
extension SellYourItemViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return  offerAlbum.count

        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SellectedOfferImagesCollectionViewCell", for: indexPath) as!
                
                SellectedOfferImagesCollectionViewCell
        cell.offerImage.image = offerAlbum[indexPath.row]
        cell.deleteButton?.layer.setValue(indexPath.row, forKey: "index")
               
               
        cell.deleteButton?.addTarget(self, action: #selector(deletePhoto(sender:)), for: UIControl.Event.touchUpInside)
              return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // Fallback on earlier versions
        return CGSize(width: 70, height: (collectionView.bounds.height) - 20)

        }
    @objc func deletePhoto(sender:UIButton) {
        let i : Int = (sender.layer.value(forKey: "index")) as! Int
          offerAlbum.remove(at: i)
        if isEditProduct
        {
            presenter.deleteOfferAlbumImage(token: token!, image: "")
        }
          sellectdOfferImagesCollectionView.reloadData()
      }
  
}

