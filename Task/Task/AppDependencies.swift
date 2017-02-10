//
//  AppDependencies.swift
//  Task
//
//  Created by Santosh Shanbhag on 15/1/17.
//  Copyright © 2017 Santosh Shanbhag. All rights reserved.
//

import Foundation
import UIKit
import Branch

class AppDependencies {
    
    var rootRiblet : Riblet?
    var rootInteractor : RootInteractor?
    
    func configRootView(window : UIWindow, forLaunchOptions launchOptions:[UIApplicationLaunchOptionsKey: Any]? ) {
     
        self.setupDeepLink(forLaunchOptions: launchOptions)
        
        let builder = TaskDisplayBuilder()
        let riblet = builder.build()
        self.rootRiblet = riblet
        
        if let rootInteractor = riblet.interactor as? RootInteractor {
            
            self.rootInteractor = rootInteractor
        }
        
        if let vc = riblet.viewController {
            
            window.rootViewController = vc
            window.makeKeyAndVisible()
        }
    }
    
    func setupDeepLink(forLaunchOptions launchOptions:[UIApplicationLaunchOptionsKey: Any]?) {
        
        let branch = Branch.getInstance()
        branch?.initSession(launchOptions: launchOptions, andRegisterDeepLinkHandler: { (params, error) in
            
            print("params -: %@", params?.description ?? "")
            
            if let deepLinkParams = params, let shouldRoute = deepLinkParams["+clicked_branch_link"] as? Bool{

                if (shouldRoute == true) {
                    self.rootInteractor?.handleDeepLink(params: deepLinkParams)
                }
            }
        })
    }
}
