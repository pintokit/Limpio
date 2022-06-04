//
//  ParticipantStore.swift
//  Limpio
//
//  Created by David Solis on 5/25/22.
//

import Foundation

actor ParticipantStore {
    
    private func fileURL() throws -> URL {
        return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("participant.data")
    }
    
    func load() throws -> [Participant] {
        let URL = try fileURL()
        let file = try FileHandle(forReadingFrom: URL)
        dispatchPrecondition(condition: .notOnQueue(.main))
        return try JSONDecoder().decode([Participant].self, from: file.availableData)
    }
    
    func save(participants: [Participant]) throws {
        let data = try JSONEncoder().encode(participants)
        let fileURL = try fileURL()
        try data.write(to: fileURL)
    }
}
