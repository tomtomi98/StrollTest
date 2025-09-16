//
//  StrollApp.swift
//  Stroll
//
//  Created by Hastomi Riduan Munthe on 16/09/25.
//

import SwiftUI

@main
struct StrollApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
