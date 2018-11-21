//
//  MenuTableViewCell.swift
//  Restaurant
//
//  Created by Evgeniy Ryshkov on 21/11/2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit
import SDWebImage

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    
    func update(with menuItem: MenuItem) {
        productImage.sd_setImage(with: menuItem.imageURL, placeholderImage: UIImage(named: "image_file.pdf"))
        productName.text = menuItem.name
        productPrice.text = "$\(menuItem.price)"
        productDescription.text = menuItem.detailText
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
