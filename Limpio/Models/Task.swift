//
//  Task.swift
//  Limpio
//
//  Created by David Solis on 4/27/22.
//

import Foundation

extension Room {
    
    struct Task: Identifiable, Codable {
        let id: UUID
        var name: String
        var participants: Set<Participant>
        var frequency: Int
        var lastCompletionDate: Date
        
        init(id: UUID = UUID(),
             name: String,
             participants: Set<String>,
             frequency: Int,
             lastCompletionDate: Date = Date()) {
            self.id = id
            self.name = name
            
            self.participants = Set(participants.map { Participant(name: $0) })
            self.frequency = frequency
            self.lastCompletionDate = lastCompletionDate
        }
    }
    
    struct Participant: Identifiable, Codable, Hashable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
}
