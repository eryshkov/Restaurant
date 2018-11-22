//
//  Basket.swift
//  Restaurant
//
//  Created by Evgeniy Ryshkov on 22/11/2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import Foundation

class Basket {
    static var content = Basket()
    
    var items: [MenuItem:Int] = [:]
    
    private init () {
        
    }
}
