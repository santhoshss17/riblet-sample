//
//  TaskEditViewController.swift
//  Task
//
//  Created by Santosh Shanbhag on 15/1/17.
//  Copyright © 2017 Santosh Shanbhag. All rights reserved.
//

import Foundation
import UIKit

protocol TaskEditViewInput {
    
    func displayUpdatedEditTask(task : Task)
}

protocol TaskEditViewOutput {
    
    func getEditTask() -> Task?
    func editScopeFinished()
}

class TaskEditViewController : UIViewController, TaskEditViewInput {
    
    var presenter : TaskEditViewOutput?

    @IBOutlet weak var editText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let task = self.presenter?.getEditTask() {
            
            self.updateTask(task: task)
        }
    }
    
    //MARK : - TaskEditViewInput Methods

    func displayUpdatedEditTask(task : Task) {
        
        let alert = UIAlertController(title: "Edit context changed", message: "Do you want to save current?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            
            //Save current edit using presentor - interactor - service 
        })
        alert.addAction(okAction)
        
        let discardAction = UIAlertAction(title: "Discard", style: .default, handler: { (action) in
            
            //Any Logic to cleanup?
        })

        alert.addAction(discardAction)
            
        self.present(alert, animated: true) {
            
            self.updateTask(task: task)
        }
    }
    
    //MARK : - Action Methods
    
    @IBAction func DoneButtonTapped(_ sender: UIButton) {
        
        self.presenter?.editScopeFinished()
    }
    
    //MARK : - Helper Methods

    func updateTask(task : Task) {
        
        self.editText.text = "Editing Task - " + task.name
    }
}
