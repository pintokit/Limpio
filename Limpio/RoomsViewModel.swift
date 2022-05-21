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
        } catch let error as NSError {
            if error.code == 4 {
                rooms = Room.listPreview
                try! await roomStore.save(rooms: rooms)
            } else {
                fatalError(error.localizedDescription)
            }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
