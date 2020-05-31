//
//  CounterState.swift
//  BobIOS
//
//  Created by Roi Peretz on 31/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation

import SwiftUI
import Combine

struct CounterState: Equatable {
    var counter: Int = 0
    
    static var initial: Self {
        .init(counter: 0)
    }

}

func == (lhs: CounterState, rhs: CounterState) -> Bool {
    return lhs.counter == rhs.counter
}

#if DEBUG
extension CounterState {
    static var preview: CounterState {
        let state = CounterState()
        return state
    }
}
#endif
