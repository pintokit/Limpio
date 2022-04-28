//
//  Room.swift
//  Limpio
//
//  Created by David Solis on 4/27/22.
//

import Foundation

struct Room: Identifiable, Codable {
    let id: UUID
    let name: String
    
    init(id: UUID = UUID(),
         name: String) {
        self.id = id
        self.name = name
    }
}
