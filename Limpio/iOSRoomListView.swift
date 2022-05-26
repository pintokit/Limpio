//
//  iOSRoomListView.swift
//  Limpio
//
//  Created by David Solis on 4/28/22.
//

import SwiftUI

struct iOSRoomListView: View {
    
    @State var participants: [Participant]?
    
    var body: some View {
        if participants != nil {
            let roomsViewModel = RoomsViewModel()
            RoomListView(viewModel: roomsViewModel)
        } else {
            OnBoardView(participants: $participants)
        }
    }
}

struct OnBoardView: View {
    @State private var newParticipantName: String = ""
    @Binding var participants: [Participant]?
    
    var body: some View {
        LazyVStack {
            TextField("Participant Name", text: $newParticipantName)
                .background(.gray)
            Button(action: {}) {
                Text("Next").frame(maxWidth: 300)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
    }
}

struct iOSRoomListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            iOSRoomListView()
        }
    }
}
