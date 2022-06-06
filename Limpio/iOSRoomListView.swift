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
        ParticipantListView(viewModel: viewModel)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Clear") {
                        Task {
                            await viewModel.refreshParticipants()
                        }
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        Task {
                            await viewModel.saveParticipant()
                        }
                        withAnimation {
                            viewModel.isOnBoarded = true
                        }
                    }
                }
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
