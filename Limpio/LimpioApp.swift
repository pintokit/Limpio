//
//  LimpioApp.swift
//  Limpio
//
//  Created by David Solis on 12/19/20.
//

import SwiftUI

@main
struct LimpioApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
