//
//  iOSRoomListView.swift
//  Limpio
//
//  Created by David Solis on 4/28/22.
//

import SwiftUI

struct iOSRoomListView: View {
    
    @Environment(\.scenePhase) private var scenePhase
    @Binding var rooms: [Room]
    let saveAction: () -> Void
    
    var body: some View {
        VStack {
            RoomListView(rooms: $rooms)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive {
                saveAction()
            }
        }
    }
}

struct iOSRoomListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            iOSRoomListView(rooms: .constant(Room.listPreview), saveAction: {})
        }
    }
}
