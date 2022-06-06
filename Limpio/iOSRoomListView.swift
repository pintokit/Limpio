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
        if roomsViewModel.isOnBoarded {
            RoomListView(viewModel: roomsViewModel)
        } else {
            OnBoardView(viewModel: roomsViewModel)
        }
    }
}

struct OnBoardView: View {
    
    @ObservedObject var viewModel: RoomsViewModel
    
    var body: some View {
        VStack {
            ParticipantListView(viewModel: viewModel)
            Button(action: {
                withAnimation {
                    viewModel.isOnBoarded = true
                }
            }) {
                Text("Done")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
    }
}

struct iOSRoomListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            iOSRoomListView(roomsViewModel: RoomsViewModel())
        }
    }
}
