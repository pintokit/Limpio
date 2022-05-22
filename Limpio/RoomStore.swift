//
//  RoomStorage.swift
//  Limpio
//
//  Created by David Solis on 5/21/22.
//

import Foundation

actor RoomStore {
    let homeName: String
    
    init(homeName: String) {
        self.homeName = homeName
    }
    
    private func fileURL () throws -> URL {
        let lowercasedHomeName = homeName.lowercased()
        return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("\(lowercasedHomeName).data")
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
