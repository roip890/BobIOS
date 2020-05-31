//
//  WishDBDataSource.swift
//  BobIOS
//
//  Created by Roi Peretz on 26/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation
import Combine

protocol WishDBDataSource {
    func getWishes() -> AnyPublisher<[WishDomainModel], Error>
    func store(wishes: [WishDomainModel]) -> AnyPublisher<Void, Error>
    func store(wish: WishDomainModel) -> AnyPublisher<Void, Error>
}
