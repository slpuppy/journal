//
//  journalApp.swift
//  journal
//
//  Created by Gabriel Puppi on 31/08/21.
//

import SwiftUI

@main
struct journalApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
        }
    }
}
