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
        productImage.makeRounded()
        productName.text = menuItem.name
        productPrice.text = "$\(menuItem.price)"
        productDescription.text = menuItem.detailText
        
        
    }
    
//    - (void)layoutSubviews {
//    [super layoutSubviews];
//    self.imageView.frame = CGRectMake(5,5,40,32.5);
//    float limgW =  self.imageView.image.size.width;
//    if(limgW > 0) {
//    self.textLabel.frame = CGRectMake(55,self.textLabel.frame.origin.y,self.textLabel.frame.size.width,self.textLabel.frame.size.height);
//    self.detailTextLabel.frame = CGRectMake(55,self.detailTextLabel.frame.origin.y,self.detailTextLabel.frame.size.width,self.detailTextLabel.frame.size.height);
//    }
//    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
