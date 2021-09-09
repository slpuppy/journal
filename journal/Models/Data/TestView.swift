//
//  TestView.swift
//  journal
//
//  Created by Paulo Tadashi Tokikawa on 09/09/21.
//

import SwiftUI

struct TestView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TestView_Previews: PreviewProvider {
    let persistenceContainer = PersistenceController.shared
    static var previews: some View {
        TestView()
    }
}
