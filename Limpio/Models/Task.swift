//
//  Task.swift
//  Limpio
//
//  Created by David Solis on 4/27/22.
//

import Foundation

struct Task: Identifiable, Codable {
    let id: UUID
    var name: String
    var participants: [Participant]
    var frequency: Int
    var lastCompletionDate: Date
    
    init(id: UUID = UUID(),
         name: String,
         participants: [String],
         frequency: Int,
         lastCompletionDate: Date = Date()) {
        self.id = id
        self.name = name
        self.participants = participants.map { Participant(name: $0) }
        self.frequency = frequency
        self.lastCompletionDate = lastCompletionDate
    }
}

extension Task {
    
    struct Participant: Identifiable, Codable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
}
