//
//  RoomStore.swift
//  Limpio
//
//  Created by David Solis on 5/4/22.
//

import SwiftUI

class RoomStore: ObservableObject {
    @Published var rooms: [Room] = []
    
    private static func fileURL () throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("limpio.data")
    }
    
    static func load(completion: @escaping(Result<[Room], Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let rooms = try JSONDecoder().decode([Room].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(rooms))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(rooms: [Room], completion: @escaping(Result<Int, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(rooms)
                let fileURL = try fileURL()
                try data.write(to: fileURL)
                DispatchQueue.main.async {
                    completion(.success(rooms.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    @discardableResult
    static func save(rooms: [Room]) async throws -> Int {
        try await withCheckedThrowingContinuation { continuation in
            save(rooms: rooms) { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error)
                case .success(let roomsSaved):
                    continuation.resume(returning: roomsSaved)
                }
            }
        }
    }
}
