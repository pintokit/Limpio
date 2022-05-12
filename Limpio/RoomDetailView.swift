//
//  RoomDetailView.swift
//  Limpio
//
//  Created by David Solis on 5/5/22.
//

import SwiftUI

struct RoomDetailView: View {
    
    @Binding var room: Room
    
    var body: some View {
        VStack {
            ForEach(room.tasks) { task in
                Label(task.name, systemImage: "pin.circle")
                ForEach(task.participants) { participant in
                    Label(participant.name, systemImage: "person")
                }
                Label(task.frequency.description.localizedLowercase, systemImage: "repeat.circle")
                HStack {
                    Text("Completed:")
                    Text(task.lastCompletionDate, style: .relative)
                    Text("ago")
                }
            }
        }
        .navigationTitle(room.name)
    }
}

struct RoomDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            RoomDetailView(room: .constant(Room.listPreview[0]))
        }
    }
}
