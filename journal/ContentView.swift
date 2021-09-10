//
//  ContentView.swift
//  journal
//
//  Created by Gabriel Puppi on 31/08/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(){
            ProgressBarView(value: 2)
            MoodTrackerView()
        }.background(Color("BackgroundColor").ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
