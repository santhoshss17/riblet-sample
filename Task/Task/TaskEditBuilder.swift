//
//  TaskEditBuilder.swift
//  Task
//
//  Created by Santosh Shanbhag on 15/1/17.
//  Copyright © 2017 Santosh Shanbhag. All rights reserved.
//

import Foundation

import UIKit

class TaskEditBuilder : Builder {
    
    override func build() -> Riblet {
        
        let router = TaskEditRouter()
        
        let interactor = TaskEditInteractor()
        interactor.router = router
        
        let presenter = TaskEditPresenter()
        presenter.presenterOuput = interactor
        interactor.interactorOutput = presenter
        
        let editRiblet = Riblet(router: router, interactor: interactor, builder: self)
        router.riblet = editRiblet

        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TaskEditViewController") as? TaskEditViewController {
            
            vc.presenter = presenter
            presenter.viewInput = vc
            editRiblet.viewController = vc
        }
        
        return editRiblet
    }
    
    override func build(parentInteractor : Interactor) -> Riblet {
        
        let riblet = self.build()
        
        if let editListener = parentInteractor as? TaskEditInteractorListener, let editInteractor = riblet.interactor as? TaskEditInteractor {
            
            editInteractor.delegate = editListener
            parentInteractor.setEventListener(listener: editInteractor)
        }
        
        return riblet
    }
}
