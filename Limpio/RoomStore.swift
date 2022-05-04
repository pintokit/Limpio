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
    
}
