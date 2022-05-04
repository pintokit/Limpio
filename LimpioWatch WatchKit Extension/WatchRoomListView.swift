//
//  WatchRoomListView.swift
//  LimpioWatch WatchKit Extension
//
//  Created by David Solis on 4/28/22.
//

import SwiftUI

struct WatchRoomListView: View {
    
    @Binding var rooms: [Room]
    
    var body: some View {
        RoomListView(rooms: $rooms)
    }
}

struct WatchRoomListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchRoomListView(rooms: .constant(Room.listPreview))
    }
}
