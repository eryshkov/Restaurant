//
//  MenuController.swift
//  Restaurant
//
//  Created by Evgeniy Ryshkov on 19/11/2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import Foundation

class MenuController {
    let baseURL = URL(string: "http://api.armenu.net:8090/")!
    
    func fetchCategories(completion: @escaping ([String]?) -> Void) {
        let categoryURL = baseURL.appendingPathComponent("categories")
    }
    
    func fetchMenuItems(forCategory categoryName: String,
                        completion: @escaping ([MenuItem]?) -> Void
        ) {
        let initialURL = baseURL.appendingPathComponent("menu")
        var components = URLComponents(url: initialURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
        guard let menuURL = components.url else {fatalError("\(#function) Erroneous category name for GET request")}
        
    }
    
    func submitOrder(forMenuIDs menuIDs: [Int],
                     completion: (Int?) -> Void
        ) {
        let orderURL = baseURL.appendingPathComponent("order")
    }
}
