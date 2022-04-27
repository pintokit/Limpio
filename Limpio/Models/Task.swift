//
//  Task.swift
//  Limpio
//
//  Created by David Solis on 4/27/22.
//

import Foundation

struct Task {
    let uuid: UUID = UUID()
    var name: String
    var participants: [String]
    var frequency: String
    var lastCompletionDate: Date
}
