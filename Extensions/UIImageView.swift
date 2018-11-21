//
//  UIImageView.swift
//  Restaurant
//
//  Created by Evgeniy Ryshkov on 21/11/2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

extension UIImageView {
    func makeRounded() {
        let image = self
//        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
//        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = image.frame.height/2 //This will change with corners of image and height/2 will make this circle shape
        image.clipsToBounds = true
    }
    
    func makeCornered(with corner: CGFloat) {
        let image = self
        //        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        //        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = corner //This will change with corners
        image.clipsToBounds = true
    }
}

