//
//  WatchRoomDetailView.swift
//  LimpioWatch WatchKit Extension
//
//  Created by David Solis on 4/28/22.
//

import SwiftUI

struct WatchRoomDetailView: View {
    
    var body: some View {
        RoomEditView()
    }
}

struct WatchRoomDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoomEditView()
        }
    }
}
