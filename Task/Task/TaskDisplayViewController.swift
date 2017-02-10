//
//  TaskDisplayViewController.swift
//  Task
//
//  Created by Santosh Shanbhag on 14/1/17.
//  Copyright © 2017 Santosh Shanbhag. All rights reserved.
//

import Foundation
import UIKit

protocol TaskDisplayViewInput {
 
    func displayTasks(tasks : [Task])
}

protocol TaskDisplayViewOutput {
    
    func getTasks()
    func editTask(task : Task)
}

class TaskDisplayViewController : UIViewController,TaskDisplayViewInput  {
    
    var presenter : TaskDisplayViewOutput?
    var tasks : [Task]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchTasks()
    }
    
    //#MARK - TableView Delegate / Datasource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.tasks?.count ?? 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskDisplayViewCell", for: indexPath)
        cell.textLabel?.text = self.tasks?[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        
        if let task = self.tasks?[indexPath.row] {
         
            self.presenter?.editTask(task: task)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //#MARK - TaskDisplayViewInput Methods
    
    func displayTasks(tasks : [Task]) {
        
        self.tasks = tasks
        self.tableView.reloadData()
    }

    //#MARK - Helper Methods
    
    func fetchTasks() {
        
        self.presenter?.getTasks()
    }
    
}
