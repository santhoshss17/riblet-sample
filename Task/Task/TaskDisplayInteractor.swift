//
//  TaskDisplayInteractor.swift
//  Task
//
//  Created by Santosh Shanbhag on 14/1/17.
//  Copyright © 2017 Santosh Shanbhag. All rights reserved.
//

import Foundation
import UIKit

protocol TaskDisplayInteractorOutput {
        
    func presentTasks(tasks : [[String:String]])
}

enum ChangeEvent {
    
    case Task
}

class TaskDisplayInteractor : Interactor, TaskDisplayPresenterOutput, TaskEditInteractorListener, RootInteractor {
    
    var router : TaskDisplayRouter?
    var interactorOutput : TaskDisplayInteractorOutput?
    
    var selTaskId : String? {
        
        willSet {
            
            let event = Event(action: .willChange, context: ChangeEvent.Task as AnyObject?)
            self.postEvent(event: event)
        }
        
        didSet {
            
            let event = Event(action: .didChanged, context: ChangeEvent.Task as AnyObject?)
            self.postEvent(event: event)
        }
    }
    
    //#MARK : - RootInteractor Methods
    
    func handleDeepLink(params : [AnyHashable:Any]) {
        
        if let route = DeepLinkParserService().parse(params: params), let screen = route.routeScreen {
            switch screen {
            case "edit":
                self.displayEditScreenWithContext(context: route.routeContext)
            default:
                print("No Where")
            }
        }
    }

    //#MARK : - TaskEditInteractorListener Methods

    func selectedTaskId() -> String? {
        
        return self.selTaskId
    }
    
    func finishedEditing() {
        
        self.router?.detachView(routeType: .edit)
    }

    //#MARK : - TaskDisplayPresenterOutput Methods
    
    func fetchAllTasks() {
        
        let tasks = TaskDownloadService().downloadTask()
        self.interactorOutput?.presentTasks(tasks: tasks)
    }
    
    func proceedEditTask(taskId : String) {
        
        self.selTaskId = taskId
        self.router?.attachView(routeType: .edit)
    }
    
    //#MARK : - Helper Methods
    
    func displayEditScreenWithContext(context : AnyObject?) {
        
        if let selTaskId = context as? String {
            
            self.selTaskId = selTaskId

            if self.router?.interactorForContext(routeType: .edit) == nil {
                
                self.router?.attachView(routeType: .edit)
            }
        }
    }

}
