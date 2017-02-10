//
//  TaskEditInteractor.swift
//  Task
//
//  Created by Santosh Shanbhag on 15/1/17.
//  Copyright © 2017 Santosh Shanbhag. All rights reserved.
//

import Foundation
import UIKit

protocol TaskEditInteractorOutput {
    
    func didChanged(toTask task : [String:String]?)
}

protocol TaskEditInteractorListener {
    
    func selectedTaskId() -> String?
    func finishedEditing()
}

class TaskEditInteractor : Interactor, TaskEditPresenterOutput, EventListener {
    
    var router : TaskEditRouter?
    var interactorOutput : TaskEditInteractorOutput?
    var delegate : TaskEditInteractorListener?
    
    //#MARK: - TaskEditPresenterOutput Methods
    
    func selectedEdiTask() -> [String:String]? {
        
        var task : [String:String]? = nil
        if let id = self.delegate?.selectedTaskId() {
            
            task = TaskDownloadService().task(id: id)
        }

        return task
    }
    
    func finishedEditing() {
        
        self.delegate?.finishedEditing()
    }
    
    //MARK: EventListener Methods
    
    func eventChanged(forEvent event : Event) {
    
        print("Event Changed!!");
        
        switch event.action {
        case .didChanged:
            let task = self.selectedEdiTask()
            self.interactorOutput?.didChanged(toTask: task)
        default:
            break;
        }
    }

}
