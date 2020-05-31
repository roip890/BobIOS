//
//  CounterView.swift
//  BobIOS
//
//  Created by Roi Peretz on 31/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import SwiftUI
import Combine

struct CounterView: View {
    
    @EnvironmentObject var viewModel: CounterViewModel
    
    var body: some View {
        VStack {
            Button(action: {self.viewModel.intents.send(.increase(amount: 1))}, label: { Text("▲") })
            Text(String(self.viewModel.state.counter))
            Button(action: {self.viewModel.intents.send(.decrease(amount: 1))}, label: { Text("▼") })
        }
    }

}

#if DEBUG
struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
#endif
