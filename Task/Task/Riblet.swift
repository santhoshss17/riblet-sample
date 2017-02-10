//
//  Riblet.swift
//  Task
//
//  Created by Santosh S on 17/1/17.
//  Copyright © 2017 Santosh Shanbhag. All rights reserved.
//

import Foundation
import UIKit

class Riblet : Equatable {
    
    var router : Router
    var interactor : Interactor
    var builder : Builder
    
    var viewController : UIViewController?
        
    init(router : Router, interactor : Interactor, builder : Builder) {
        
        self.router = router
        self.interactor = interactor
        self.builder = builder
    }
}

func ==(lhs: Riblet, rhs: Riblet) -> Bool {
    
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}
