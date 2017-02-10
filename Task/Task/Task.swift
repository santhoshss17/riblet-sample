//
//  Task.swift
//  Task
//
//  Created by Santosh Shanbhag on 15/1/17.
//  Copyright © 2017 Santosh Shanbhag. All rights reserved.
//

import Foundation

class Task {
    
    var id : String
    var name : String
    var canEdit : Bool = true //Default
    
    init(id: String, name : String) {
        
        self.id = id
        self.name = name
    }
}
