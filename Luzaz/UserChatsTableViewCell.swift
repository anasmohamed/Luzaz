//
//  UserChatsTableViewCell.swift
//  Luzaz
//
//  Created by jets on 1/10/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit
import SDWebImage
class UserChatsTableViewCell: UITableViewCell,UsersChatsCellView {
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

  
    func displayUserName(name: String) {
        friendNameLabel.text = name
    }
    func displayUserImage(image: String) {
        DispatchQueue.main.async {
              self.friendImage.sd_setImage(with: URL(string: "http://luzaz.com/upload/\(image)"))
        }
        
    }
    
}
