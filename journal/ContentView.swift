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
    
    @State var print = ""
    
    func addFeeling(){
        //Feeling.addUserFeeling(tag: "\(Int.random(in: 1...9999))", type: .outros)
        let jour = Journal(initialMood: Int.random(in: 1...10))
        jour.addFeelings(feelings: [
            controller.feelings[5],
            controller.feelings[6],
            controller.feelings[10]
        ])
        jour.addText(question: controller.question[0], awnser: "\(Int.random(in: 1...1000))")
        jour.addText(question: controller.question[1], awnser: "\(Int.random(in: 1...1000))")
        jour.addText(question: controller.question[2], awnser: "\(Int.random(in: 1...1000))")
        controller.saveJournal(jour)
    }
    
    func deleteJournal(offsets: IndexSet){
        print = controller.feelings[offsets.first!].tag
    }
    
    var body: some View {
        NavigationView{
            List() {
                ForEach(controller.journal) {journal in
                    VStack{
                        Text("\(journal.date)")
                        ForEach(journal.dailyTexts) { texts in
                            HStack{
                                Text(texts.question.text)
                                Text(texts.text)
                            }
                        }
                        
                    }
                }
                .onDelete(perform: deleteJournal)
            }
            .navigationTitle(print)
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
