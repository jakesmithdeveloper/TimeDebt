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
    
    @Query(sort: [SortDescriptor(\Activity.debt, order: .reverse)]) var activites: [Activity]
    
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        ForEach(activites) { activity in
                            HStack {
                                Group {
                                    Text(activity.name)
                                    Text(activity.debtDisplay)
                                    Button("\(activity.activeDisplay)") { activity.active.toggle() }
                                }
                                .padding()
                            }
                            .padding()
                            .listRowSeparator(.hidden)
                        }
                        .onDelete(perform: deleteActivity)
                    }
                }
            }
            .toolbar {
                Button(action: addActivity, label: {
                    Label("add", systemImage: "plus")
                })
            }
        }
        .navigationTitle("TimeDebt")
    }
    
    func addActivity() {
        let activity = Activity(name: "Hobby 1", debt: 1800)
        modelContext.insert(activity)
    }
    
    func deleteActivity(_ indexSet: IndexSet) {
        for item in indexSet {
            let object = activites[item]
            modelContext.delete(object)
        }
    }
    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Activity.self, configurations: config)
        
    for i in 1...5 {
        let activity = Activity(name: "Activity \(i)", debt: Double(i*60))
        container.mainContext.insert(activity)
    }
    
    return ContentView()
        .modelContainer(container)
}
