//
//  WishModule.swift
//  BobIOS
//
//  Created by Roi Peretz on 28/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Resolver

extension Resolver {

    static func registerWishModule() {

        // Wish CoreData DataSource
        register { WishCoreDataDataSource(persistentStore: resolve()) }
            .implements(WishDBDataSource.self)

        // Wish Network DataSource
        register { WishNetworkDataSource() }
            .implements(WishWebDataSource.self)

        // Wish Repository
        register { WishRepositoryImplementation(
            wishWebDataSource: resolve(),
            wishDBDataSource: resolve()
            )
        }
        .implements(WishRepository.self)

    }
    
}
