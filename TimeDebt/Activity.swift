//
//  Activity.swift
//  TimeDebt
//
//  Created by Jake Smith on 4/2/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Activity {
    var name: String
    var debt: TimeInterval
    
    var debtDisplay: String {
        let formatter = DateComponentsFormatter()
        return formatter.string(from: debt) ?? ""
    }
    
    func second() {
        debt = debt.advanced(by: -1.0)
    }
    
    init(name: String, debt: TimeInterval) {
        self.name = name
        self.debt = debt
    }
    
}
