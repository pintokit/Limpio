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
                iOSRoomListView(rooms: $store.rooms)
                    .environmentObject(store)
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
