//
//  LimpioApp.swift
//  Limpio
//
//  Created by David Solis on 4/25/22.
//

import SwiftUI

@main
struct LimpioApp: App {
    
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    iOSRoomListView(roomsViewModel: RoomsViewModel())
                }
            } else {
                NavigationView {
                    iOSRoomListView(roomsViewModel: RoomsViewModel())
                }
            }
        }
    }
}
