//
//  TimeDebtApp.swift
//  TimeDebt
//
//  Created by Jake Smith on 4/2/24.
//

import SwiftUI
import SwiftData

@main
struct TimeDebtApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Activity.self)
        }
    }

}
