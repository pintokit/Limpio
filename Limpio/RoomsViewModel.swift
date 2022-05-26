//
//  RoomsViewModel.swift
//  Limpio
//
//  Created by David Solis on 5/21/22.
//

import Foundation

class RoomsViewModel: ObservableObject {
    
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
}
