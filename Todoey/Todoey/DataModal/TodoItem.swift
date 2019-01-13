//
//  TodoItem.swift
//  Todoey
//
//  Created by Aaryan Garg on 13/01/19.
//  Copyright © 2019 Robin Garg. All rights reserved.
//

import Foundation

class TodoItem: Codable {
    
    var title: String = ""
    var completed: Bool = false
    
    init(title: String) {
        self.title = title
    }
}
