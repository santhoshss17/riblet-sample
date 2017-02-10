//
//  TaskDisplayBuilder.swift
//  Task
//
//  Created by Santosh Shanbhag on 14/1/17.
//  Copyright © 2017 Santosh Shanbhag. All rights reserved.
//

import Foundation
import UIKit

class TaskDisplayBuilder : Builder {
    
    var interactor : TaskDisplayInteractor?
    
    override func build() -> Riblet {
        
        let router = TaskDisplayRouter()
        
        let interactor = TaskDisplayInteractor()
        interactor.router = router
        self.interactor = interactor
        
        let presenter = TaskDisplayPresenter()
        presenter.presenterOuput = interactor
        interactor.interactorOutput = presenter

        let displayRiblet = Riblet(router: router, interactor: interactor, builder: self)
        router.riblet = displayRiblet

        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TaskDisplayViewController") as? TaskDisplayViewController {
            
            vc.presenter = presenter
            presenter.viewInput = vc
            displayRiblet.viewController = vc
        }

        return displayRiblet
    }
}
