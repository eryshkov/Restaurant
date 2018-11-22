//
//  Array.swift
//  Restaurant
//
//  Created by Evgeniy Ryshkov on 22/11/2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
// https://www.hackingwithswift.com/example-code/language/how-to-remove-duplicate-items-from-an-array

import Foundation

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
