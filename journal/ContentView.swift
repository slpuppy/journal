//
//  ContentView.swift
//  journal
//
//  Created by Gabriel Puppi on 31/08/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var journalData: JournalController
    
    @StateObject var viewRouter: ViewRouter
    @State var dataSource = Feeling.shared
    
    func addFeeling(){
        //Feeling.addUserFeeling(tag: "\(Int.random(in: 1...9999))", type: .outros)
        dataSource = Feeling.shared
    }
    
    var body: some View {
        NavigationView{
            List(dataSource) { feeling in
                Text("\(feeling.tag)")
            }
            .navigationTitle("sample")
            .navigationBarItems(trailing: Button("AddFeeling"){
                addFeeling()
            })
        }
        
//        GeometryReader { geometry in
//            VStack{
//                Spacer()
//
//                switch viewRouter.currentPage {
//                case .home:
//                    Text("Inicio")
//                case .colection:
//                    Text("Coleção de sentimentos")
//                case .history:
//                    Text("Histórico")
//                case .profile:
//                    Text("Perfil")
//                }
//
//                Spacer()
//                TabBar(viewRouter: viewRouter).frame(width: geometry.size.width, height: geometry.size.height / 8)
//
//            }.background(Color("BackgroundColor").ignoresSafeArea())
//            .edgesIgnoringSafeArea(.bottom)
//            //MoodTrackerView()
//        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
