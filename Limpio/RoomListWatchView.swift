//
//  RoomListWatchView.swift
//  Limpio
//
//  Created by David Solis on 4/27/22.
//

import SwiftUI

struct RoomListWatchView: View {
    @State private var rooms: [Room] = Room.listPreview
    
    var body: some View {
        List {
            ForEach(rooms) { room in
                HStack {
                    Image(systemName: "house.fill")
                    Text(room.name)
                }
            }
            .onDelete {
                rooms.remove(atOffsets: $0)
            }
            .onMove {
                rooms.move(fromOffsets: $0, toOffset: $1)
            }
            EditButton()
        }
        .navigationTitle("Rooms")
    }
}

struct RoomListWatchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoomListWatchView()
        }
        .previewLayout(.fixed(width: 396, height: 484))
        .environment(\.colorScheme, .dark)
    }
}
