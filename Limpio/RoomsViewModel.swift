//
//  RoomsViewModel.swift
//  Limpio
//
//  Created by David Solis on 5/21/22.
//

import Foundation

class RoomsViewModel: ObservableObject {
    
    @Published var rooms: [Room] = []
    let homeName: String
    
    init(homeName: String) {
        self.homeName = homeName
    }
    
    func refresh() async {
        let roomStore = RoomStorage(homeName: homeName)
        do {
            rooms = try await roomStore.load()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
