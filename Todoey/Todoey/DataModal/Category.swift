//
//  Category.swift
//  Todoey
//
//  Created by Aaryan Garg on 18/01/19.
//  Copyright © 2019 Robin Garg. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
