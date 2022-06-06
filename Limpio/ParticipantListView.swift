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
                    .submitLabel(.next)
                    .onSubmit {
                        addParticipant()
                    }
#if os(iOS)
                Button(action: {
                    withAnimation {
                        addParticipant()
                    }
                }) {
                    Image(systemName: "plus.circle")
                }
                .disabled(newParticipantName.isEmpty)
#endif
            }
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
    
    func addParticipant() {
        let newParticipant = Participant(name: newParticipantName)
        viewModel.participants.append(newParticipant)
        newParticipantName = ""
    }
}

struct ParticipantListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ParticipantListView(viewModel: RoomsViewModel())
        }
    }
}
