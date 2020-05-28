//
//  Task.swift
//  TodoList
//
//  Created by Iskandar Herputra Wahidiyat on 15/04/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit
import RealmSwift

struct Task: Codable {
    var title: String
    var description: String
}

class Task2: Object {
    @objc dynamic var title: String?
    @objc dynamic var taskDescription: String?
    
    convenience init(title: String, taskDescription: String) {
        self.init()
        self.title = title
        self.taskDescription = taskDescription
    }
    
    
}
