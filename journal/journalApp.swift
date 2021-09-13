//
//  journalApp.swift
//  journal
//
//  Created by Gabriel Puppi on 31/08/21.
//

import SwiftUI
import CoreData

@main
struct journalApp: App {
    
    var persistentContainer = PersistenceController.shared
    var body: some Scene {
        
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistentContainer.container.viewContext)
        }
    }
}
