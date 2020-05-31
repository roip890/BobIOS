//
//  ContentView.swift
//  BobIOS
//
//  Created by Roi Peretz on 28/05/2020.
//  Copyright © 2020 Aptenobytes. All rights reserved.
//

import SwiftUI
import Combine
import EnvironmentOverrides

struct ContentView: View {
    
    var body: some View {
        Group {
            CounterView()
            .environmentObject(CounterViewModel())
        }
    }
}

// MARK: - Preview

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
