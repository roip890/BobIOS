//
//  CounterViewModel.swift
//  BobIOS
//
//  Created by Roi Peretz on 31/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import Foundation
import Combine
import Resolver

class CounterViewModel: ObservableObject {
        
    var intents: PassthroughSubject<CounterIntent, Never> = PassthroughSubject<CounterIntent, Never>()

    @Published var state: CounterState = CounterState()
    
    var cancelBag: CancelBag = CancelBag()
    
    init() {
        intents
        .flatMap { intent in self.intentToAction(intent: intent) }
        .flatMap{ action in self.proccessResult(action: action) }
        .sink { result in
            self.state = self.reduceResultToState(result: result)
        }
        .store(in: cancelBag)
        
    }
    
    func intentToAction(intent: CounterIntent) -> AnyPublisher<CounterAction, Never> {
        switch intent {
        case let .increase(amount):
            return Just(CounterAction.increase(amount: amount))
            .eraseToAnyPublisher()
        case let .decrease(amount):
            return Just(CounterAction.decrease(amount: amount))
            .eraseToAnyPublisher()
        }
    }
        
    func proccessResult(action: CounterAction) -> AnyPublisher<CounterResult, Never> {
        switch action {
        case let .increase(amount):
            return Future<CounterResult, Never> { promise in
                promise(.success(.increase(.success(counter: self.state.counter + amount))))
            }
            .prepend(.increase(.loading))
            .eraseToAnyPublisher()
        case let .decrease(amount):
            return Future<CounterResult, Never> { promise in
                promise(.success(.decrease(.success(counter: self.state.counter - amount))))
            }
            .prepend(.decrease(.loading))
            .eraseToAnyPublisher()
        }
    }
    
    func reduceResultToState(result: CounterResult) -> CounterState {
        var state = self.state
        switch result {
        case let .increase(.success(counter)):
            state.counter = counter
        case let .decrease(.success(counter)):
            state.counter = counter
        default:
            break
        }
        return state
    }
}
