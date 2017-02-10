//
//  ArrayExtension.swift
//  Task
//
//  Created by Santosh S on 17/1/17.
//  Copyright © 2017 Santosh Shanbhag. All rights reserved.
//

import Foundation

extension Array {
    
    mutating func removeObject<U: Equatable>(object: U) {
        var index: Int?
        for (idx, objectToCompare) in enumerated() {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        
        if(index != nil) {
            self.remove(at: index!)
        }
    }
}
