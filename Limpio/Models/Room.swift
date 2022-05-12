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
        Room(name: "Livingroom", tasks: [Task(name: "Clean couch", participants: ["Solis, Brandon, Mazza"], frequency: 1)]),
        Room(name: "Bathroom", tasks: [Task(name: "Clean shower door", participants: ["Solis, Brandon, Mazza"], frequency: 2)]),
        Room(name: "Kitchen", tasks: [Task(name: "Empty trash", participants: ["Solis, Brandon, Mazza"], frequency: 3)]),
        Room(name: "Bedroom", tasks: [Task(name: "Make bed", participants: ["Solis"], frequency: 4)])
    ]
}
