//
//  LimpioApp.swift
//  LimpioWatch WatchKit Extension
//
//  Created by David Solis on 4/28/22.
//

import SwiftUI

@main
struct LimpioApp: App {
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                WatchRoomListView(roomsViewModel: RoomsViewModel())
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
