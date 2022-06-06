//
//  Task.swift
//  Limpio
//
//  Created by David Solis on 4/27/22.
//

import UIKit

extension Room {
        
    struct Task: Identifiable, Codable {
        let id: UUID
        var name: String
        var participants: Set<Participant>
        var frequency: Int
        var lastCompletionDate: Date
        
        init(id: UUID = UUID(),
             name: String,
             participants: Set<Participant>,
             frequency: Int,
             lastCompletionDate: Date = Date()) {
            self.id = id
            self.name = name
            self.participants = participants
            self.frequency = frequency
            self.lastCompletionDate = lastCompletionDate
        }
    }
}

struct Participant: Identifiable, Codable, Hashable {
    let id: UUID
    var name: String
    var photo: URL?
    
    init(id: UUID = UUID(), name: String, photo: URL? = nil) {
        self.id = id
        self.name = name
        self.photo = photo
    }
}

extension Participant {
    static let listPreview: [Participant] = [Participant(name: "Solis"), Participant(name: "Mazza"), Participant(name: "Bahr")]
}
