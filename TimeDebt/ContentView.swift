//
//  ContentView.swift
//  TimeDebt
//
//  Created by Jake Smith on 4/2/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query var activites: [Activity]
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(activites) { activity in
                    Text(activity.name)
                }
            }
            .padding()
            .toolbar {
                Button(action: addActivity, label: {
                    Label("add", systemImage: "plus")
                })
            }
        }
    }
    
    func addActivity() {
        let activity = Activity(name: "Hobby 1", debt: 1800)
        modelContext.insert(activity)
    }
    
}

#Preview {
    ContentView()
}
