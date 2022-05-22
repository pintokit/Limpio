//
//  iOSRoomListView.swift
//  Limpio
//
//  Created by David Solis on 4/28/22.
//

import SwiftUI

struct iOSRoomListView: View {
    
    @State private var homeName: String?
    
    var body: some View {
        if let homeName = homeName {
            let roomViewModel = RoomsViewModel(homeName: homeName)
            RoomListView(viewModel: roomViewModel)
        } else {
            HomeView(homeName: $homeName)
        }
    }
}

struct HomeView: View {
    @State private var newHomeName: String = ""
    @Binding var homeName: String?
    var body: some View {
        LazyVStack {
            TextField("Home Name", text: $newHomeName)
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
