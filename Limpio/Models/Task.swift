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
    var participants: [String]
    var frequency: String
    var room: Room
    var lastCompletionDate: Date
    
    init(id: UUID = UUID(),
         name: String,
         participants: [String],
         frequency: String,
         room: Room,
         lastCompletionDate: Date = Date()) {
        self.id = id
        self.name = name
        self.participants = participants
        self.frequency = frequency
        self.room = room
        self.lastCompletionDate = lastCompletionDate
    }
}

extension Task {
    static let listPreview: [Task] = [Task(name: "Empty trash", participants: ["Solis, Brandon, Mazza"], frequency: "3", room: Room(name: "Kitchen")), Task(name: "Clean shower door", participants: ["Solis, Brandon, Mazza"], frequency: "2", room: Room(name: "Bathroom")), Task(name: "Clean couch", participants: ["Solis, Brandon, Mazza"], frequency: "1", room: Room(name: "Livingroom")), Task(name: "Make bed", participants: ["Solis"], frequency: "4", room: Room(name: "Bedroom"))]
}
