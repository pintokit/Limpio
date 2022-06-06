//
//  RoomsViewModel.swift
//  Limpio
//
//  Created by David Solis on 5/21/22.
//

import Foundation

class RoomsViewModel: ObservableObject {
    
    @Published var isOnBoarded: Bool = UserDefaults.standard.bool(forKey: "isOnBoarded") {
        didSet {
            UserDefaults.standard.set(isOnBoarded, forKey: "isOnBoarded")
        }
    }
    @Published var participants: [Participant] = []
    @Published var rooms: [Room] = []
    
    func refresh() async {
        let roomStore = RoomStore()
        do {
            rooms = try await roomStore.load()
        } catch let error as NSError {
            if error.code == 4 {
                // add sample room data after first launch
                rooms = Room.listPreview
                try! await roomStore.save(rooms: rooms)
            } else {
                fatalError(error.localizedDescription)
            }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func save() async {
        let roomStore = RoomStore()
        do {
            try await roomStore.save(rooms: rooms)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func refreshParticipants() async {
        let store = ParticipantStore()
        do {
            participants = try await store.load()
        } catch let error as NSError {
            if error.code == 4 {
                participants = Participant.listPreview
                try! await store.save(participants: participants)
            } else {
                fatalError(error.localizedDescription)
            }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func saveParticipant() async {
        let store = ParticipantStore()
        do {
            try await store.save(participants: participants)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
