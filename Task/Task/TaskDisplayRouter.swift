//
//  TaskDisplayRouter.swift
//  Task
//
//  Created by Santosh Shanbhag on 14/1/17.
//  Copyright © 2017 Santosh Shanbhag. All rights reserved.
//

import Foundation
import UIKit

enum TaskDisplayRouterType : Int {
    
    case edit
}

class TaskDisplayRouter : Router {
    
    func attachView(routeType : TaskDisplayRouterType){
        
        switch routeType {
        case .edit:
            
            let editBuilder = TaskEditBuilder()
            
            let editRiblet = editBuilder.build(parentInteractor: self.riblet!.interactor)
            
            let context = Context(hashValue: routeType.rawValue)
            self.addChild(context: context, riblet: editRiblet)
            
            if let childVC = editRiblet.viewController {
                
                self.riblet?.viewController?.present(childVC, animated: true, completion: {
                    
                })
            }

        default:
            print("Route not supported yet!")
        }
    }
    
    func detachView(routeType : TaskDisplayRouterType) {
        
        switch routeType {
        case .edit:

            let context = Context(hashValue: routeType.rawValue)
            
            if let riblet = self.childRiblet(context: context) {
                
                riblet.viewController?.dismiss(animated: true, completion: {
    
                    self.removeChild(context: context)
                })
            }

        default:
            print("Route not supported yet!")
        }
    }

    func interactorForContext(routeType : TaskDisplayRouterType) -> Interactor? {
        
        let context = Context(hashValue: routeType.rawValue)
        let riblet = self.childRiblet(context: context)
        return riblet?.interactor
    }
}
