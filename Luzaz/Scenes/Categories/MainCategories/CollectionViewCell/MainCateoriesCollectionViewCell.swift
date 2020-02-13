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
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10

        // Initialization code
    }
    func displayMainCategoriesImage(mainCategoriesImage: String) {
          categoryNameLabel.text = mainCategoriesImage
        if mainCategoriesImage == "Vehicles" || mainCategoriesImage == "نقل واتوبيسات"
        {
            mainCategoryImageView.image = UIImage(named:"car.jpg")
        }
        if mainCategoriesImage == "Properties" || mainCategoriesImage == "عقارات"
        {
            mainCategoryImageView.image = UIImage(named:"real_state.jpg")
        }
        
        if mainCategoriesImage == "Mobiles & Accessories" || mainCategoriesImage == "موبايلات واكسسواراتها"
        {
            mainCategoryImageView.image = UIImage(named:"phones")
        }
        if mainCategoriesImage == "الكترونيات وأجهزة منزلية" || mainCategoriesImage == "الكترونيات وأجهزة منزلية"
        {
            mainCategoryImageView.image = UIImage(named:"home_appliances")
        }
        if mainCategoriesImage == "المنزل والحديقة" || mainCategoriesImage == "المنزل والحديقة"
        {
            mainCategoryImageView.image = UIImage(named:"home_and_garden")
        }
        if mainCategoriesImage == "الموضة والجمال" || mainCategoriesImage == "الموضة والجمال"
        {
            mainCategoryImageView.image = UIImage(named:"beauty_and_health")
        }
        
        if mainCategoriesImage == "حيوانات أليفة" || mainCategoriesImage == "حيوانات أليفة"
        {
            mainCategoryImageView.image = UIImage(named:"animals")
        }
        if mainCategoriesImage == "مستلزمات أطفال" || mainCategoriesImage == "مستلزمات أطفال"
        {
            mainCategoryImageView.image = UIImage(named:"kids_clothes")
        }
        if mainCategoriesImage == "دراجات ومعدات رياضية"
            || mainCategoriesImage == "دراجات ومعدات رياضية"
            
        {
            mainCategoryImageView.image = UIImage(named:"sporting")
        }
        if mainCategoriesImage == "موسيقى وفنون وكتب" || mainCategoriesImage == "موسيقى وفنون وكتب"
        {
            mainCategoryImageView.image = UIImage(named:"music")
        }
        if mainCategoriesImage == "وظائف" || mainCategoriesImage == "وظائف"
        {
            mainCategoryImageView.image = UIImage(named:"jobs")
        }
        if mainCategoriesImage == "تجارة وصناعة" || mainCategoriesImage == "تجارة وصناعة"
        {
            mainCategoryImageView.image = UIImage(named:"industrial")
        }
        if mainCategoriesImage == "خدمات" || mainCategoriesImage == "خدمات"
        {
            mainCategoryImageView.image = UIImage(named:"service")
        }
        if mainCategoriesImage == "مجموعة فرعية" || mainCategoriesImage == "مجموعة فرعية"
        {
            mainCategoryImageView.image = UIImage(named:"car.jpg")
        }
        if mainCategoriesImage == "رحلات سياحة وفنادق" || mainCategoriesImage == "رحلات سياحة وفنادق"
        {
            mainCategoryImageView.image = UIImage(named:"trips")
        }
        if mainCategoriesImage == "Clothes" || mainCategoriesImage == "ملابس"
        {
            mainCategoryImageView.image = UIImage(named:"clothes")
        }
        if mainCategoriesImage == "Hand Made - الصناعات اليدوية" || mainCategoriesImage == "Hand Made - الصناعات اليدوية"
        {
            mainCategoryImageView.image = UIImage(named:"handmade")
        }
        print("the name \(mainCategoriesImage)")
    }
}
