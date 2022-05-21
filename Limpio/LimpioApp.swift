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
            .onAppear {
                RoomStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let rooms):
                        store.rooms = rooms
                    }
                }
            }
        }
    }
}
