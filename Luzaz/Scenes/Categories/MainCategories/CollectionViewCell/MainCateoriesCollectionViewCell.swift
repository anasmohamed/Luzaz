//
//  MainCateoriesCollectionViewCell.swift
//  Luzaz
//
//  Created by jets on 1/11/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit

class MainCateoriesCollectionViewCell: UICollectionViewCell,MainCategoriesCellView {
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    @IBOutlet weak var mainCategoryImageView: UIImageView!
    var language : String?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        language = UserDefaults.standard.string(forKey: "language")
        // Initialization code
    }
    func displayMainCategoriesImage(mainCategoriesImage: String) {
        
        
        if mainCategoriesImage == "Vehicles" || mainCategoriesImage == "نقل واتوبيسات"
        {
            mainCategoryImageView.image = UIImage(named:"car.jpg")
            if language == "en"{
                categoryNameLabel.text = "Vehicles"
            } else{
                categoryNameLabel.text = "نقل واتوبيسات"
                
            }
            
        }
        if mainCategoriesImage == "Properties" || mainCategoriesImage == "عقارات"
        {
            mainCategoryImageView.image = UIImage(named:"real_state.jpg")
            if language == "en"{
                categoryNameLabel.text = "Properties"
            } else{
                categoryNameLabel.text = "عقارات"
                
            }
        }
        
        if mainCategoriesImage == "Mobiles & Accessories" || mainCategoriesImage == "موبايلات واكسسواراتها"
        {
            mainCategoryImageView.image = UIImage(named:"phones")
            if language == "en"{
                categoryNameLabel.text = "Mobiles & Accessories"
            } else{
                categoryNameLabel.text = "موبايلات واكسسواراتها"
                
            }
            
        }
        if mainCategoriesImage == "الكترونيات وأجهزة منزلية" || mainCategoriesImage == "الكترونيات وأجهزة منزلية"
        {
            mainCategoryImageView.image = UIImage(named:"home_appliances")
            if language == "en"{
                categoryNameLabel.text = "Electronics & Home Appliances"
            } else{
                categoryNameLabel.text = "الكترونيات وأجهزة منزلية"
                
            }
        }
        if mainCategoriesImage == "المنزل والحديقة" || mainCategoriesImage == "المنزل والحديقة"
        {
            mainCategoryImageView.image = UIImage(named:"home_and_garden")
            if language == "en"{
                categoryNameLabel.text = "Home & Garden"
            } else{
                categoryNameLabel.text = "المنزل والحديقة"
                
            }
        }
        if mainCategoriesImage == "الموضة والجمال" || mainCategoriesImage == "الموضة والجمال"
        {
            mainCategoryImageView.image = UIImage(named:"beauty_and_health")
            if language == "en"{
                categoryNameLabel.text = "Fashion and Beauty"
            } else{
                categoryNameLabel.text = "الموضة والجمال"
                
            }
        }
        
        if mainCategoriesImage == "حيوانات أليفة" || mainCategoriesImage == "حيوانات أليفة"
        {
            mainCategoryImageView.image = UIImage(named:"animals")
            if language == "en"{
                categoryNameLabel.text = "Pets"
            } else{
                categoryNameLabel.text = "حيوانات أليفة"
                
            }
        }
        if mainCategoriesImage == "مستلزمات أطفال" || mainCategoriesImage == "مستلزمات أطفال"
        {
            mainCategoryImageView.image = UIImage(named:"kids_clothes")
            if language == "en"{
                          categoryNameLabel.text = "kids Accessories"
                      } else{
                          categoryNameLabel.text = "مستلزمات أطفال"
                          
                      }
        }
        if mainCategoriesImage == "دراجات ومعدات رياضية"
            || mainCategoriesImage == "دراجات ومعدات رياضية"
            
        {
            mainCategoryImageView.image = UIImage(named:"sporting")
            if language == "en"{
                categoryNameLabel.text = "Sports Bikes & Equipments"
            } else{
                categoryNameLabel.text = "دراجات ومعدات رياضية"
                
            }
        }
        if mainCategoriesImage == "موسيقى وفنون وكتب" || mainCategoriesImage == "موسيقى وفنون وكتب"
        {
            mainCategoryImageView.image = UIImage(named:"music")
            if language == "en"{
                categoryNameLabel.text = "Music , Arts & Books"
            } else{
                categoryNameLabel.text = "موسيقى وفنون وكتب"
                
            }
        }
        if mainCategoriesImage == "وظائف" || mainCategoriesImage == "وظائف"
        {
            mainCategoryImageView.image = UIImage(named:"jobs")
            if language == "en"{
                categoryNameLabel.text = "Jobs"
            } else{
                categoryNameLabel.text = "وظائف"
                
            }
        }
        if mainCategoriesImage == "تجارة وصناعة" || mainCategoriesImage == "تجارة وصناعة"
        {
            mainCategoryImageView.image = UIImage(named:"industrial")
            if language == "en"{
                categoryNameLabel.text = "Industrial"
            } else{
                categoryNameLabel.text = "تجارة وصناعة"
                
            }
        }
        
        if mainCategoriesImage == "خدمات" || mainCategoriesImage == "خدمات"
        {
            mainCategoryImageView.image = UIImage(named:"service")
            if language == "en"{
                categoryNameLabel.text = "Service"
            } else{
                categoryNameLabel.text = "خدمات"
                
            }
        }
        if mainCategoriesImage == "مجموعة فرعية" || mainCategoriesImage == "مجموعة فرعية"
        {
            mainCategoryImageView.image = UIImage(named:"car.jpg")
            if language == "en"{
                categoryNameLabel.text = "Sub Catigories"
            } else{
                categoryNameLabel.text = "مجموعة فرعية"
                
            }
        }
        if mainCategoriesImage == "رحلات سياحة وفنادق" || mainCategoriesImage == "رحلات سياحة وفنادق"
        {
            mainCategoryImageView.image = UIImage(named:"trips")
            if language == "en"{
                categoryNameLabel.text = "trips"
            } else{
                categoryNameLabel.text = "رحلات سياحة وفنادق"
                
            }
        }
        if mainCategoriesImage == "Clothes" || mainCategoriesImage == "ملابس"
        {
            mainCategoryImageView.image = UIImage(named:"clothes")
            if language == "en"{
                categoryNameLabel.text = "clothes"
            } else{
                categoryNameLabel.text = "ملابس"
                
            }
        }
        if mainCategoriesImage == "Hand Made - الصناعات اليدوية" || mainCategoriesImage == "Hand Made - الصناعات اليدوية"
        {
            mainCategoryImageView.image = UIImage(named:"handmade")
            if language == "en"{
                categoryNameLabel.text = "Hand Made"
            } else{
                categoryNameLabel.text = "الصناعات اليدوية"
                
            }
        }
        print("the name \(mainCategoriesImage)")
    }
}
