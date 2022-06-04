//
//  ParticipantListView.swift
//  Limpio
//
//  Created by David Solis on 5/25/22.
//

import SwiftUI

struct ParticipantListView: View {
    
    @ObservedObject var viewModel: RoomsViewModel
    @State private var newParticipantName = ""
    
    var body: some View {
        List {
            ForEach(viewModel.participants) { participant in
                Text(participant.name)
            }
            HStack {
                TextField("New participant", text: $newParticipantName)
                Button(action: {
                    withAnimation {
                        let newParticipant = Participant(name: newParticipantName)
                        viewModel.participants.append(newParticipant)
                        Task {
                            await viewModel.saveParticipant()
                        }
                        newParticipantName = ""
                    }
                }) {
                    Image(systemName: "plus.circle")
                }
                .disabled(newParticipantName.isEmpty)
            }
        }
        .task {
            await viewModel.refreshParticipants()
        }
        .refreshable {
            await viewModel.refreshParticipants()
        }
        .navigationTitle("Participants")
    }
}

struct ParticipantListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ParticipantListView(viewModel: RoomsViewModel())
        }
    }
}
