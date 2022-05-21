//
//  RoomListView.swift
//  Limpio
//
//  Created by David Solis on 4/27/22.
//

import SwiftUI

struct RoomListView: View {
    
    @EnvironmentObject private var viewModel: RoomsViewModel
    @State private var newRoomName = ""
    @Binding var rooms: [Room]
    
    var body: some View {
        List {
            ForEach($rooms) { $room in
                NavigationLink(destination: RoomDetailView(room: $room)) {
                    HStack {
                        Image(systemName: "house.fill")
                        Text(room.name)
                    }
                }
            }
            .onDelete {
                rooms.remove(atOffsets: $0)
            }
            .onMove {
                rooms.move(fromOffsets: $0, toOffset: $1)
            }
            HStack {
                TextField("New Room", text: $newRoomName)
                Button(action: {
                    withAnimation {
                        let newRoom = Room(name: newRoomName)
                        rooms.append(newRoom)
                        Task {
                            await viewModel.save()
                        }
                        newRoomName = ""
                    }
                }) {
                    Image(systemName: "plus.circle")
                }
                .disabled(newRoomName.isEmpty)
            }
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
            RoomListView(rooms: .constant(Room.listPreview))
        }
    }
}
