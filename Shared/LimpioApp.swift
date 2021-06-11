//
//  LimpioApp.swift
//  Shared
//
//  Created by David Solis on 6/11/21.
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
