//
//  WishCoreDataDataSource.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation
import CoreData
import Combine

public struct WishCoreDataDataSource: WishDBDataSource {
    
    let persistentStore: PersistentStore
    
    func getWishes() -> AnyPublisher<[WishDomainModel], Error> {
        let fetchRequest = WishCoreDataModel.wishes()
        return persistentStore
            .fetch(fetchRequest)
            .map {
                $0.map {
                    $0.toDomainModel()
                }
            }
            .eraseToAnyPublisher()
    }

    func store(wishes: [WishDomainModel]) -> AnyPublisher<Void, Error> {
        return persistentStore
            .update { context in
                wishes.forEach {
                    context.insert($0.toCoreDataModel())
                }
                try? context.save()
            }
    }

    func store(wish: WishDomainModel) -> AnyPublisher<Void, Error> {
        return persistentStore
            .update { context in
                context.insert(wish.toCoreDataModel())
                try? context.save()
            }
    }

}

extension WishCoreDataModel {
        
    static func wishes() -> NSFetchRequest<WishCoreDataModel> {
        let request = newFetchRequest()
        request.predicate = NSPredicate(value: true)
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        request.fetchBatchSize = 10
        return request
    }
    
}
