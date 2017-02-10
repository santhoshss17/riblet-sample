//
//  TaskEditPresenter.swift
//  Task
//
//  Created by Santosh Shanbhag on 15/1/17.
//  Copyright © 2017 Santosh Shanbhag. All rights reserved.
//

import Foundation
import UIKit

protocol TaskEditPresenterOutput {
    
    func selectedEdiTask() -> [String:String]?
    func finishedEditing()
}

class TaskEditPresenter : TaskEditViewOutput,TaskEditInteractorOutput {
    
    var presenterOuput : TaskEditPresenterOutput?
    var viewInput : TaskEditViewInput?
    
    //MARK :- TaskEditViewOutput Methods
    
    func getEditTask() -> Task? {
        
        if let task = self.presenterOuput?.selectedEdiTask(), let id = task["TaskId"], let name = task["Task"] {
            
            return Task(id: id, name: name)
        }
        
        return nil
    }
    
    func editScopeFinished() {
        
        self.presenterOuput?.finishedEditing()
    }
    
    //MARK :- TaskEditInteractorOutput Methods
    
    func didChanged(toTask task : [String:String]?) {
        
        if let selectedTask = task, let id = selectedTask["TaskId"], let name = selectedTask["Task"] {
            
            self.viewInput?.displayUpdatedEditTask(task: Task(id: id, name: name))
        }
    }

}
