//
//  iOSRoomListView.swift
//  Limpio
//
//  Created by David Solis on 4/28/22.
//

import SwiftUI

struct iOSRoomListView: View {
    
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewRoomView = false
    @Binding var rooms: [Room]
    
    var body: some View {
        VStack {
            RoomListView(rooms: $rooms)
            Button("New Room") {
                isPresentingNewRoomView = true
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .sheet(isPresented: $isPresentingNewRoomView) {
                NavigationView {
                    RoomEditView()
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Dismiss") {
                                    isPresentingNewRoomView = false
//                                    RESET NEW ROOM TO ROOMS
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
//                                    ADD NEW ROOM TO ROOMS
                                    isPresentingNewRoomView = false
                                }
                            }
                        }
                }
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive {
//                SAVE ACTION
            }
        }
    }
}

struct iOSRoomListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            iOSRoomListView(rooms: .constant(Room.listPreview))
        }
    }
}
