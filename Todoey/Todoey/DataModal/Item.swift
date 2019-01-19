//
//  Item.swift
//  Todoey
//
//  Created by Aaryan Garg on 18/01/19.
//  Copyright © 2019 Robin Garg. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var completed: Bool = false
    @objc dynamic var createdAt: Date = Date()
    
    var category = LinkingObjects(fromType: Category.self, property: "items")
}
