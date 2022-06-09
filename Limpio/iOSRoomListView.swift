//
//  iOSRoomListView.swift
//  Limpio
//
//  Created by David Solis on 4/28/22.
//

import SwiftUI

struct iOSRoomListView: View {
    
    @StateObject var roomsViewModel: RoomsViewModel
    
    var body: some View {
        RoomListView(viewModel: roomsViewModel)
            .sheet(isPresented: $roomsViewModel.onBoardUser) {
                if #available(iOS 16.0, *) {
                    NavigationStack {
                        ParticipantListView(viewModel: roomsViewModel)
                    }
                }
            }
    }
}

struct iOSRoomListView_Previews: PreviewProvider {
    static var previews: some View {
        iOSRoomListView(roomsViewModel: RoomsViewModel())
    }
}
