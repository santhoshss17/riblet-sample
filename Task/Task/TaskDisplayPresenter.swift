//
//  TaskDisplayPresenter.swift
//  Task
//
//  Created by Santosh Shanbhag on 14/1/17.
//  Copyright © 2017 Santosh Shanbhag. All rights reserved.
//

import Foundation
import UIKit

protocol TaskDisplayPresenterOutput {
    
    func fetchAllTasks()
    func proceedEditTask(taskId : String)
}

class TaskDisplayPresenter : TaskDisplayViewOutput, TaskDisplayInteractorOutput {
    
    var presenterOuput : TaskDisplayPresenterOutput?
    var viewInput : TaskDisplayViewInput?
    
    //MARK : - TaskDisplayViewOutput Methods

    func getTasks() {
        
        self.presenterOuput?.fetchAllTasks()
    }
    
    func editTask(task : Task) {

        if (task.canEdit) {
            self.presenterOuput?.proceedEditTask(taskId: task.id)
        }
    }

    //MARK: -  TaskDisplayInteractorOutput Methods
    
    func presentTasks(tasks : [[String:String]]) {
        
        var viewModelTasks : [Task] = []
        
        for task in tasks {
            
            if let id = task["TaskId"], let name = task["Task"] {
                viewModelTasks.append(Task(id:id,name:name))
            }
        }
        
        self.viewInput?.displayTasks(tasks: viewModelTasks)
    }
}
