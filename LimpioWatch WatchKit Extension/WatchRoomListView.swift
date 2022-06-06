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
        NavigationView {
            if roomsViewModel.isOnBoarded {
                RoomListView(viewModel: roomsViewModel)
            } else {
                OnBoardView(viewModel: roomsViewModel)
            }
        }
    }
}

struct OnBoardView: View {
    
    @ObservedObject var viewModel: RoomsViewModel
    
    var body: some View {
        ParticipantListView(viewModel: viewModel)
    }
}

struct WatchRoomListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WatchRoomListView(roomsViewModel: RoomsViewModel())
        }
    }
}
