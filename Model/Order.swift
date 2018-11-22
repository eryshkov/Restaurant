//
//  Order.swift
//  Restaurant
//
//  Created by Evgeniy Ryshkov on 19/11/2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
    
    func getOrderPrice() -> Double {
        var result: Double = 0
        
        for item in menuItems {
            result += item.price
        }
        
        return result
    }
    
    func getMenuIDs() -> [Int] {
        var result = [Int]()
        
        for item in menuItems {
            result.append(item.id)
        }
        
        return result
    }
}
