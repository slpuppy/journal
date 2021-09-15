//
//  journalApp.swift
//  journal
//
//  Created by Gabriel Puppi on 31/08/21.
//

import SwiftUI

@main
struct journalApp: App {
    @ObservedObject var controller = JournalController()
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter).environmentObject(controller)
        }
    }
}

