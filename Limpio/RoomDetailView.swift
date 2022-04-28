//
//  RoomDetailView.swift
//  Limpio
//
//  Created by David Solis on 4/27/22.
//

import SwiftUI

struct RoomDetailView: View {
    
    @State private var roomName: String = ""
    
    var body: some View {
        Form {
            TextField("Room name", text: $roomName)
        }
    }
}

struct RoomDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RoomDetailView()
    }
}
