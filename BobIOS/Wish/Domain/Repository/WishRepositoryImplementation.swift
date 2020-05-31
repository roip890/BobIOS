//
//  WishRepositoryImplementation.swift
//  BobIOS
//
//  Created by Roi Peretz on 27/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation
import Combine

public struct WishRepositoryImplementation: WishRepository {
    
    let wishWebDataSource: WishWebDataSource
    let wishDBDataSource: WishDBDataSource
    
    init(wishWebDataSource: WishWebDataSource, wishDBDataSource: WishDBDataSource) {
        self.wishWebDataSource = wishWebDataSource
        self.wishDBDataSource = wishDBDataSource
    }

    
    func getWishes() -> AnyPublisher<[WishDomainModel], Error> {
        return self.wishWebDataSource.getWishes()
    }
    
    func store(wishes: [WishDomainModel]) -> AnyPublisher<Void, Error> {
        return self.wishDBDataSource.store(wishes: wishes)
    }
    
    func store(wish: WishDomainModel) -> AnyPublisher<Void, Error> {
        return self.wishDBDataSource.store(wish: wish)
    }
    
    func getWishText() -> String {
        return "Wish"
    }
    
}
