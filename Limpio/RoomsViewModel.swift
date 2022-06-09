//
//  RoomsViewModel.swift
//  Limpio
//
//  Created by David Solis on 5/21/22.
//

import Foundation

class RoomsViewModel: ObservableObject {
    
    @MainActor @Published var onBoardUser: Bool = true {
        didSet {
            DispatchQueue.main.async {
                UserDefaults.standard.set(self.onBoardUser, forKey: "onBoardUser")
            }
        }
    }
    @MainActor @Published var participants: [Participant] = []
    @MainActor @Published var rooms: [Room] = []
    
    func refreshRooms() async {
        let roomStore = RoomStore()
        do {
            let loadedRooms = try await roomStore.load()
            DispatchQueue.main.async {
                self.rooms = loadedRooms
            }
        } catch let error as NSError {
            if error.code == 4 {
                DispatchQueue.main.async {
                    self.rooms = Room.listPreview
                }
                try! await roomStore.save(rooms: rooms)
            } else {
                fatalError(error.localizedDescription)
            }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func saveRoom() async {
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
            let loadedParticipants = try await store.load()
            DispatchQueue.main.async {
                self.participants = loadedParticipants
            }
        } catch let error as NSError {
            if error.code == 4 {
                DispatchQueue.main.async {
                    self.participants = Participant.listPreview
                }
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
