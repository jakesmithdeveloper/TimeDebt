//
//  ContentView.swift
//  TimeDebt
//
//  Created by Jake Smith on 4/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var timerOn = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var a = Activity(name: "iOS programming", debt: 1800)
    
    var body: some View {
        VStack {
            Text(a.debtDisplay)
                .onReceive(timer) { _ in
                    if timerOn {
                        a.second()
                    }
                }
            Button("\(timerOn ? "Stop" : "Start")") {
                timerOn.toggle()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
