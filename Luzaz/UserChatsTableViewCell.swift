//
//  UserChatsTableViewCell.swift
//  Luzaz
//
//  Created by jets on 1/10/1441 AH.
//  Copyright © 1441 AH Luzaz. All rights reserved.
//

import UIKit

class UserChatsTableViewCell: UITableViewCell,UsersChatsCellView {
   


    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func displayUserName(name: String) {
        friendNameLabel.text = name
    }
    func displayUserImage(image: String) {
        friendImage.image = UIImage(named: image)
    }
    
}
