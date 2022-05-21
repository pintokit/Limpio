//
//  WatchRoomListView.swift
//  LimpioWatch WatchKit Extension
//
//  Created by David Solis on 4/28/22.
//

import SwiftUI

struct WatchRoomListView: View {
    
    var body: some View {
        NavigationView {
            RoomListView()
        }
    }
}

struct WatchRoomListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WatchRoomListView()
        }
    }
}
