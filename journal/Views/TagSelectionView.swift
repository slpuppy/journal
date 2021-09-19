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
                ScrollView(){
                    VStack(alignment: .leading){
                        ForEach(feelingTypes, id: \.self){ tipo in
                            Text(tipo.description)
                                .modifier(SubTitulo())
                            WrappingHStack(alignment: .leading){
//                                ForEach(controller.$feelings.filter{type in type. == tipo}, id: \.self){ feeling in
                                    ForEach(controller.feelings.filter{$0.type == tipo}){ feeling in
                                    Text(feeling.tag)
                                        .modifier(TagTest(toggle: feeling.isSelected))
                                        .padding(2)
                                        .onTapGesture {
                                            controller.selectFeeling(feeling)
                                        }
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
