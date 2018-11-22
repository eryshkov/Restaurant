//
//  MenuController.swift
//  Restaurant
//
//  Created by Evgeniy Ryshkov on 19/11/2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class MenuController {
    let baseURL = URL(string: "http://api.armenu.net:8090/")!
    
    func replaceHost(at url:URL) -> URL {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            fatalError("Unable to change host at \(#function) \(#file) line \(#line)")
        }
        
        urlComponents.host = baseURL.host
        
        guard let newURL = urlComponents.url else {
            fatalError("Unable create new URL at \(#function) \(#file) line \(#line)")
        }
        
        return newURL
    }
    
    func fetchCategories(completion:  @escaping ([String]?) -> Void) {
        let categoryURL = baseURL.appendingPathComponent("categories")
        
        let task = URLSession.shared.dataTask(with: categoryURL) {
            data, response, error in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            guard let jsonDictionary = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                completion(nil)
                return
            }
            
            guard let categories = jsonDictionary?["categories"] as? [String] else{
                completion(nil)
                return
            }
            
            completion(categories)
        }
        task.resume()
    }
    
    func fetchMenuItems(forCategory categoryName: String,
                        completion: @escaping ([MenuItem]?) -> Void
        ) {
        let initialURL = baseURL.appendingPathComponent("menu")
        var components = URLComponents(url: initialURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
        guard let menuURL = components.url else {fatalError("\(#function) Erroneous category name for GET request")}
        
        let task = URLSession.shared.dataTask(with: menuURL) {
            data, response, error in
            
            let jsonDecoder = JSONDecoder()
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            guard let menuItems = try? jsonDecoder.decode(MenuItems.self, from: data) else {
                completion(nil)
                return
            }

            var newMenuItems = [MenuItem]()
            
            for var item in menuItems.items {
                item.imageURL = self.replaceHost(at: item.imageURL)
                newMenuItems.append(item)
            }
            
            completion(newMenuItems)
            
        }
        task.resume()
    }
    
    func submitOrder(forMenuIDs menuIDs: [Int],
                     completion: @escaping (Int?) -> Void
        ) {
        let orderURL = baseURL.appendingPathComponent("order")
        var request = URLRequest(url: orderURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let data: [String: [Int]] = ["menuIds": menuIDs]
        
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(data)
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            let jsonDecoder = JSONDecoder()
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            guard let preparationTime = try? jsonDecoder.decode(PreparationTime.self, from: data) else {
                completion(nil)
                return
            }
            
            completion(preparationTime.prepTime)
        }
        task.resume()
    }
}
