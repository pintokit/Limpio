//
//  LimpioApp.swift
//  Limpio
//
//  Created by David Solis on 4/25/22.
//

import SwiftUI

@main
struct LimpioApp: App {
    @StateObject private var store = RoomStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                iOSRoomListView(rooms: $store.rooms) {
                    _Concurrency.Task {
                        do {
                            try await RoomStore.save(rooms: store.rooms)
                        } catch {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            }
            .task {
                do {
                    store.rooms = try await RoomStore.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
