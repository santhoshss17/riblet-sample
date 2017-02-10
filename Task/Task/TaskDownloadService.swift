//
//  TaskDisplayService.swift
//  Task
//
//  Created by Santosh Shanbhag on 15/1/17.
//  Copyright © 2017 Santosh Shanbhag. All rights reserved.
//

import Foundation

class TaskDownloadService {
    
    let staticTasks : Array<[String:String]> = [["Task" : "Get milk","TaskId" : "1"], ["Task" : "Get Vegies","TaskId" : "2"], ["Task" : "Attend WWDC 2017","TaskId" : "3"]]
    
    func downloadTask() -> Array<[String:String]> {
        
        //Usually a network call to fetch data
        return self.staticTasks
    }
    
    func task(id:String) -> [String:String]? {
        
        let filteredTask = self.staticTasks.filter { (task) -> Bool in
            return ((task["TaskId"] == id) == true)
        }
        
        return filteredTask.last
    }
}
