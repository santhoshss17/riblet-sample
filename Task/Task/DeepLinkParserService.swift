//
//  DeepLinkParserService.swift
//  Task
//
//  Created by Santosh S on 18/1/17.
//  Copyright © 2017 Santosh Shanbhag. All rights reserved.
//

import Foundation

struct DeepLinkRoute {
    
    var routeScreen : String?
    var routeContext : AnyObject?
    
    init(routeScreen : String?) {
        
        self.routeScreen = routeScreen
    }
}

class DeepLinkParserService {
    
    func parse(params : [AnyHashable:Any]) -> DeepLinkRoute? {
    
        var deepLinkRoute : DeepLinkRoute?
        
        if let route = params["$deeplink_path"] as? String {
            
            var screen : String = route
            var context : AnyObject?

            if let range = route.range(of: "/") {
                
                screen = route.substring(to: range.lowerBound)
                context = route.substring(from: range.upperBound) as AnyObject?
            }
            
            deepLinkRoute = DeepLinkRoute(routeScreen: screen)
            deepLinkRoute?.routeContext = context
        }
        
        return deepLinkRoute
    }
}
