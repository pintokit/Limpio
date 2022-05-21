//
//  LimpioApp.swift
//  Limpio
//
//  Created by David Solis on 4/25/22.
//

import SwiftUI

@main
struct LimpioApp: App {
    @StateObject private var viewModel = RoomsViewModel(homeName: "novios")
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                iOSRoomListView(rooms: $viewModel.rooms)
                    .environmentObject(viewModel)
            }
            .task {
                await viewModel.refresh()
            }
        }
    }
}
