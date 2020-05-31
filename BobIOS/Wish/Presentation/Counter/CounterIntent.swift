//
//  CounterIntent.swift
//  BobIOS
//
//  Created by Roi Peretz on 31/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

enum CounterIntent {
    case increase(amount: Int)
    case decrease(amount: Int)
}
