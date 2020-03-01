//
//  OffersPresenter.swift
//  Luzaz
//
//  Created by jets on 12/16/1440 AH.
//  Copyright © 1440 AH Luzaz. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import Kingfisher
import IHProgressHUD
class OffersPresenter{
    
    private weak var view: OffersView?
    private let offersInteractor: OffersInteractor
    private var offer: Offer?
    private var offers: [Offer]
    private var filteredOffers : [Offer]
    public var isOfferEmpty : Bool = false
    var offersNumber = 0
    public var imageHeight : CGFloat?
    var offersImagesList =  [CGFloat]()
    init(view: OffersView) {
        self.view = view
        offersInteractor = OffersInteractor()
        offers = [Offer]()
        filteredOffers = offers
        
    }
    
    func viewDidLoad(countryId:String,page:String) {
        
        //        getOffers(countryId:UserDefaults.standard.string(forKey: "country")!
        getOffers(countryId:countryId ,page:page)
        // )
    }
    
    func getOffers(countryId: String,page:String) {
        view?.showIndicator()
        offersInteractor.getOffers(countryId: countryId,page: page) { [unowned self] (offers, error) in
            
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            } else {
                if offers != nil{
                    if offers!.count != 0{
                        self.offers += offers!
                        self.filteredOffers = offers!
                        self.view?.getOffersSuccess()
                    }}
                else{
                    self.isOfferEmpty = true
                }
            }
        }
    }
    func getOffersCount() -> Int {
        return offers.count
    }
    func getFilteredOffersCount() -> Int {
        return filteredOffers.count
    }
    func getSearchedOffer(searchText : String) {
        filteredOffers =  offers.filter({( offer : Offer) -> Bool in
            return (offer.title?.lowercased().contains(searchText.lowercased()))!
        })
        
        
    }
    
    func configure(cell: OffersCellView, for index: Int,isFiltering : Bool,collectionView:UICollectionView) {
        let offer : Offer
        if isFiltering {
            offer = filteredOffers[index]
        }else{
            offer = offers[index]
        }
        guard let image = offer.image
            else { return }
        
        cell.displayOfferImage(offerImage: image)
        
    }
    func configure( complition: @escaping (Bool) -> Void) {
        IHProgressHUD.show()
          for i in offersNumber..<offers.count{
    
            SDWebImageManager.shared.loadImage(
                  with: URL(string: "http://luzaz.com/upload/\(offers[i].image!)"),
                  options: .highPriority, // or .highPriority
                  progress: nil,
                  completed: { [weak self] (image, data, error, cacheType, finished, url) in
                      if error != nil || image == nil
                      {
                        self!.offersImagesList.append(0)
                        if self!.offersImagesList.count == self!.offers.count
                        {
                            self!.offersNumber += 35
                            complition(true)
                        }
                      }else{
                        if !(image!.size.height < 150) {
                    self!.imageHeight = image!.size.height / 5
                        }else{
                            self!.imageHeight = image!.size.height * 1.5

                        }
                      self!.offersImagesList.append(self.self!.imageHeight ?? 0)
                    print("offers images list count \(self!.offersImagesList.count)")
                    print("offers list count \(self!.offers.count)")
                        print("image height \(self!.imageHeight)")

                      if self!.offersImagesList.count == self!.offers.count
                      {
                          self!.offersNumber += 35
                          complition(true)
                      }
                    }   }
              )

          }
            
        }
      
    
    
    
    func pushToDetails(viewController : OffersDetailsViewController, _ index : Int) {
        viewController.offer = offers[index]
        
    }
    
    func getImageHeight() ->CGFloat
    {
        return imageHeight ?? 0
    }
}


