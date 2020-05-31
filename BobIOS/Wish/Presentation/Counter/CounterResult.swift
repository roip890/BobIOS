//
//  CounterResult.swift
//  BobIOS
//
//  Created by Roi Peretz on 31/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

enum CounterResult {
    case increase(IncreaseResult)
    case decrease(DecreaseResult)

    enum IncreaseResult {
        case loading
        case success(counter: Int)
        case error(error: Error)
    }

    enum DecreaseResult {
        case loading
        case success(counter: Int)
        case error(error: Error)
    }
}
