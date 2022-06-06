//
//  Room.swift
//  Limpio
//
//  Created by David Solis on 4/27/22.
//

import Foundation

struct Room: Identifiable, Codable {
    let id: UUID
    var name: String
    var tasks: [Task]
    
    init(id: UUID = UUID(),
         name: String,
         tasks: [Task] = []) {
        self.id = id
        self.name = name
        self.tasks = tasks
    }
}

extension Room {
    static let listPreview: [Room] = [
        Room(name: "Livingroom", tasks: [Task(name: "Clean couch", participants: Set([Participant(name: "Solis"), Participant(name: "Brandon"), Participant(name: "Mazza")]), frequency: 1), Task(name: "Roomba", participants: Set([Participant(name: "Solis")]), frequency: 2)]),
        Room(name: "Bathroom", tasks: [Task(name: "Clean shower door", participants: Set([Participant(name: "Solis"), Participant(name: "Brandon"), Participant(name: "Mazza")]), frequency: 2)]),
        Room(name: "Kitchen", tasks: [Task(name: "Empty trash", participants: Set([Participant(name: "Solis"), Participant(name: "Brandon"), Participant(name: "Mazza")]), frequency: 3)]),
        Room(name: "Bedroom", tasks: [Task(name: "Make bed", participants: Set([Participant(name: "Solis"), Participant(name: "Brandon"), Participant(name: "Mazza")]), frequency: 4)])
    ]
}
