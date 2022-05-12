//
//  WatchRoomDetailView.swift
//  LimpioWatch WatchKit Extension
//
//  Created by David Solis on 4/28/22.
//

import SwiftUI

struct WatchRoomDetailView: View {
    
    @Binding var room: Room
    
    var body: some View {
        NavigationView {
            RoomDetailView(room: $room)
        }
    }
}

struct WatchRoomDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WatchRoomDetailView(room: .constant(Room.listPreview[0]))
        }
    }
}
