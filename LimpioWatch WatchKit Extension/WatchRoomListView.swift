//
//  WatchRoomListView.swift
//  LimpioWatch WatchKit Extension
//
//  Created by David Solis on 4/28/22.
//

import SwiftUI

struct WatchRoomListView: View {
    
    @StateObject var roomsViewModel: RoomsViewModel
    
    var body: some View {
        RoomListView(viewModel: roomsViewModel)
            .sheet(isPresented: $roomsViewModel.onBoardUser) {
                if #available(watchOS 9.0, *) {
                    NavigationStack {
                        ParticipantListView(viewModel: roomsViewModel)
                    }
                }
            }
    }
}

struct WatchRoomListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchRoomListView(roomsViewModel: RoomsViewModel())
    }
}
