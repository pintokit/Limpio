//
//  RoomListView.swift
//  Limpio
//
//  Created by David Solis on 4/27/22.
//

import SwiftUI

struct RoomListView: View {
    
    @ObservedObject var viewModel: RoomsViewModel
    @State private var newRoomName = ""
    
    var body: some View {
        List {
            ForEach($viewModel.rooms) { $room in
                NavigationLink(destination: RoomDetailView(viewModel: viewModel, room: $room)) {
                    HStack {
                        Image(systemName: "house.fill")
                        Text(room.name)
                    }
                }
            }
            .onDelete {
                viewModel.rooms.remove(atOffsets: $0)
            }
            .onMove {
                viewModel.rooms.move(fromOffsets: $0, toOffset: $1)
                Task {
                    await viewModel.saveRoom()
                }
            }
            HStack {
                TextField("New Room", text: $newRoomName)
                Button(action: {
                    withAnimation {
                        let newRoom = Room(name: newRoomName)
                        viewModel.rooms.append(newRoom)
                        Task {
                            await viewModel.saveRoom()
                        }
                        newRoomName = ""
                    }
                }) {
                    Image(systemName: "plus.circle")
                }
                .disabled(newRoomName.isEmpty)
            }
        }
        .task {
            await viewModel.refreshRooms()
        }
        .refreshable {
            await viewModel.refreshRooms()
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
            RoomListView(viewModel: RoomsViewModel())
        }
    }
}
