//
//  RoomEditView.swift
//  Limpio
//
//  Created by David Solis on 4/27/22.
//

import SwiftUI

struct RoomEditView: View {
    
    @State private var roomName: String = ""
    
    var body: some View {
        Form {
            TextField("Room name", text: $roomName)
        }
        .navigationTitle("New Room")
    }
}

struct RoomEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoomEditView()
        }
    }
}
