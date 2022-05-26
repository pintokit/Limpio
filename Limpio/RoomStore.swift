//
//  RoomStorage.swift
//  Limpio
//
//  Created by David Solis on 5/21/22.
//

import Foundation

actor RoomStore {
    
    private func fileURL () throws -> URL {
        return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("room.data")
    }
    
    func load() throws -> [Room] {
        let URL = try fileURL()
        let file = try FileHandle(forReadingFrom: URL)
        dispatchPrecondition(condition: .notOnQueue(.main))
        return try JSONDecoder().decode([Room].self, from: file.availableData)
    }
    
    func save(rooms: [Room]) throws {
        let data = try JSONEncoder().encode(rooms)
        let fileURL = try fileURL()
        try data.write(to: fileURL)
    }
}
