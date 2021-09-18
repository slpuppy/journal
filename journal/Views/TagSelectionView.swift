//
//  TagSelectionView.swift
//  journal
//
//  Created by Bruna Naomi Yamanaka Silva on 09/09/21.
//

import SwiftUI
import WrappingStack

struct TagSelectionView: View {
    let feelingTypes: [FeelingType] = [FeelingType.alegria, FeelingType.tristeza, FeelingType.antecipacao, FeelingType.surpresa, FeelingType.nojo, FeelingType.confianca, FeelingType.raiva, FeelingType.medo, FeelingType.outros]
    @EnvironmentObject var controller: JournalController
    
    var body: some View {
    
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text("O que você está sentindo?")
                    .fontWeight(.bold)
                    .modifier(Titulos())
                    .padding(.bottom)
//                    WrappingHStack(id: \.self, alignment: .leading) {
//
//                                }
//                Button("create feeling"){
//                    controller.addUserFeeling(tag: "batata", text: "pipipipopopo" , type: .alegria, isExpanded: false)
//                }
                ScrollView(){
                    VStack(alignment: .leading){
                        ForEach(feelingTypes, id: \.self){ tipo in
                            Text(tipo.description)
                                .modifier(SubTitulo())
                            let categoryFeelings : [Feeling] = controller.feelings.filter{
                                $0.type == tipo
                            }
                            WrappingHStack(alignment: .leading){
                                ForEach(categoryFeelings){ feeling in
                                    Text(feeling.tag)
                                        .modifier(Tags())
                                        .padding(2)
                                }
                            }
                            
                            }
                    }
                }
                    
                
            }
            
        }.padding()
    }
}

//struct TagSelectionView_Previews: PreviewProvider {
//    @ObservedObject var controller = JournalController()
//    static var previews: some View {
//        TagSelectionView()
//    }
//}
