//
//  Router.swift
//  Task
//
//  Created by Santosh Shanbhag on 15/1/17.
//  Copyright © 2017 Santosh Shanbhag. All rights reserved.
//

import Foundation
import UIKit

struct Context : Hashable, Equatable {
    
    var hashValue: Int
}
func ==(lhs: Context, rhs: Context) -> Bool {
    
    return lhs.hashValue == rhs.hashValue
}

class Router  {
    
    var riblet : Riblet?
    var childRiblets : [Context : Riblet] = [:]

    func addChild(context : Context, riblet : Riblet) {
        
        self.childRiblets[context] = riblet
    }
    
    func removeChild(context : Context) {
        
        if (self.childRiblets[context] != nil) {
            
            self.childRiblets[context] = nil
        }
    }
    
    func childRiblet(context : Context) -> Riblet? {
        
        return self.childRiblets[context]
    }
}

