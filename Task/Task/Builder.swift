//
//  Builder.swift
//  Task
//
//  Created by Santosh S on 17/1/17.
//  Copyright © 2017 Santosh Shanbhag. All rights reserved.
//

import Foundation

protocol BuilderProtocol {
    func build() -> Riblet
}

class Builder : BuilderProtocol  {

    func build() -> Riblet {
        
        abort()
    }
    
    func build(parentInteractor : Interactor) -> Riblet {
        
        abort()
    }

}
