//
//  MenuItem.swift
//  FoodMenu
//
//  Created by Amir Mostafavi on 1/16/20.
//  Copyright © 2020 amir. All rights reserved.
//

import SwiftUI

struct MenuItem: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var description: String
    var category: Category
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case starter = "starter"
    }
}

