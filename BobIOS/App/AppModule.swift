//
//  AppModule.swift
//  BobIOS
//
//  Created by Roi Peretz on 31/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Resolver

extension Resolver {

    static func registerAppModule() {

        // Persistence Store
        register { CoreDataStack(version: CoreDataStack.Version.actual) }
            .implements(PersistentStore.self)

        // Wish Module
        registerWishModule()
        
    }
    
}
