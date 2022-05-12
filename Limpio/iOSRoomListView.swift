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
    
    var body: some View {
        VStack {
            RoomListView(rooms: $rooms)
        }
    }
}

struct iOSRoomListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            iOSRoomListView(rooms: .constant(Room.listPreview))
        }
    }
}
