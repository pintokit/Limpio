//
//  iOSRoomListView.swift
//  Limpio
//
//  Created by David Solis on 4/28/22.
//

import SwiftUI

struct iOSRoomListView: View {
    
    @Environment(\.editMode) private var editMode
    
    var body: some View {
        RoomListView()
    }
}

struct iOSRoomListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoomListView()
        }
    }
}
