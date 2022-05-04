//
//  LimpioApp.swift
//  LimpioWatch WatchKit Extension
//
//  Created by David Solis on 4/28/22.
//

import SwiftUI

@main
struct LimpioApp: App {
    @StateObject private var store = RoomStore()
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                WatchRoomListView(rooms: $store.rooms)
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

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
