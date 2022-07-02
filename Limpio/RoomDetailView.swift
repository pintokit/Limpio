//
//  RoomDetailView.swift
//  Limpio
//
//  Created by David Solis on 5/5/22.
//

import SwiftUI

struct RoomDetailView: View {
    
    @Binding var room: Room
    @State private var isPresentingTaskEditView = false
    
    var body: some View {
        List {
            ForEach(room.tasks) { task in
                VStack {
                    Label(task.name, systemImage: "pin.circle")
                    let participantNames = Array(task.participants)
                    ForEach(participantNames) { participant in
                        Label(participant.name, systemImage: "person")
                    }
                    Label(task.frequency.description.localizedLowercase, systemImage: "repeat.circle")
                    HStack {
                        Text("Completed:")
                        Text(task.lastCompletionDate, style: .relative)
                        Text("ago")
                    }
                    Divider()
                }
                .background(.purple)
            }
        }
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    isPresentingTaskEditView = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $isPresentingTaskEditView) {
                    
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
