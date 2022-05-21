//
//  LimpioApp.swift
//  LimpioWatch WatchKit Extension
//
//  Created by David Solis on 4/28/22.
//

import SwiftUI

@main
struct LimpioApp: App {
    @StateObject private var viewModel = RoomsViewModel(homeName: "novios")
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                WatchRoomListView(rooms: $viewModel.rooms)
                    .environmentObject(viewModel)
            }
            .task {
                await viewModel.refresh()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
