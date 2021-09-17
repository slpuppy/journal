//
//  ContentView.swift
//  journal
//
//  Created by Gabriel Puppi on 31/08/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var controller: JournalController
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(spacing: 0){
                Spacer()
                
                switch viewRouter.currentPage {
                case .home:
                    HomeView(viewRouter: viewRouter)
                case .collection:
                   FeelingsCollectionView()
                case .history:
                    Text("Histórico")
                case .profile:
                    ProfileView()
                }
                
                
                TabBar(viewRouter: viewRouter).frame(width: geometry.size.width, height: geometry.size.height / 8)
                
            }.background(Color("BackgroundColor").ignoresSafeArea())
            .edgesIgnoringSafeArea(.bottom)
            //MoodTrackerView()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
