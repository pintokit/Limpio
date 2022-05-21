//
//  iOSRoomListView.swift
//  Limpio
//
//  Created by David Solis on 4/28/22.
//

import SwiftUI

struct iOSRoomListView: View {
    
    var body: some View {
        RoomListView()
    }
}

struct iOSRoomListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            iOSRoomListView()
        }
    }
}
