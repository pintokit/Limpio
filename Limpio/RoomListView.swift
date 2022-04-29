//
//  RoomListView.swift
//  Limpio
//
//  Created by David Solis on 4/27/22.
//

import SwiftUI

struct RoomListView: View {
    
    @State private var rooms: [Room] = Room.listPreview
    @State private var newRoom: String = ""
    
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
#if os(watchOS)
            TextField("New Room", text: $newRoom)
#endif
        }
        .navigationTitle("Rooms")
#if os(iOS)
        .toolbar {
            EditButton()
        }
#endif
    }
}

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoomListView()
        }
    }
}
