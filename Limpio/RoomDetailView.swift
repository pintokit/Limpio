//
//  RoomDetailView.swift
//  Limpio
//
//  Created by David Solis on 5/5/22.
//

import SwiftUI

struct RoomDetailView: View {
    
    @ObservedObject var viewModel: RoomsViewModel
    @Binding var room: Room
    @State private var isPresentingTaskEditView = false
    
    var body: some View {
        List {
            ForEach($room.tasks) { $task in
                NavigationLink(destination: TaskEditView(viewModel: viewModel, task: $task)) {
                    VStack {
                        Label(task.name, systemImage: "pin.circle")
                        let participantNames = Array($task.participants)
                        ForEach(participantNames) { $participant in
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
                .background(.purple)
            }
            .onDelete {
                room.tasks.remove(atOffsets: $0)
            }
            .onMove {
                room.tasks.move(fromOffsets: $0, toOffset: $1)
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
#if os(iOS)
            ToolbarItem(placement: .bottomBar) {
                EditButton()
            }
#endif
        }
        .navigationTitle(room.name)
    }
}

struct RoomDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            RoomDetailView(viewModel: RoomsViewModel(), room: .constant(Room.listPreview[0]))
        }
    }
}
