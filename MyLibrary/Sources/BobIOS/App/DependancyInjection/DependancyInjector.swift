//
//  DependancyInjector.swift
//  BobIOS
//
//  Created by Roi Peretz on 28/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        
        registerAppModule()

    }
}
