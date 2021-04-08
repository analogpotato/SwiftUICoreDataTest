//
//  SwiftUICoreDataTestApp.swift
//  Shared
//
//  Created by Frank on 4/7/21.
//

import SwiftUI

@main
struct SwiftUICoreDataTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
