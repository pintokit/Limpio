//
//  RoomListView.swift
//  Limpio
//
//  Created by David Solis on 4/27/22.
//

import SwiftUI

struct RoomListView: View {
    var rooms: [Room] = Room.listPreview
    
    var body: some View {
        List {
            ForEach(rooms) { room in
                Image(systemName: "house.fill")
                Text(room.name)
            }
        }
        .navigationTitle("Rooms")
    }
}

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        RoomListWatchView()
            .previewLayout(.fixed(width: 396, height: 484))
        RoomListView()
    }
}
