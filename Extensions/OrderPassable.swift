//
//  OrderPassable.swift
//  Restaurant
//
//  Created by Evgeniy Ryshkov on 22/11/2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import Foundation

protocol OrderPassable: class {
    func passData(_ data: Order)
}
