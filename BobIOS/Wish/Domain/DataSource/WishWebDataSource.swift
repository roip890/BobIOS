//
//  WishNetworkDataSource.swift
//  BobIOS
//
//  Created by Roi Peretz on 26/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation
import Combine

protocol WishWebDataSource {
    func getWishes() -> AnyPublisher<[WishDomainModel], Error>
}
