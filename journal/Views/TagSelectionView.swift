//
//  TagSelectionView.swift
//  journal
//
//  Created by Bruna Naomi Yamanaka Silva on 09/09/21.
//

import SwiftUI
import WrappingStack

struct TagSelectionView: View {
    
    @ObservedObject var dataSource = ListDataSource()
    let humors = ["Amor", "Vigilância", "Pessimismo","Amor", "Vigilância", "Pessimismo","Amor", "Vigilância", "Pessimismo", "+" ]
    
    var body: some View {
    
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text("O que você está sentindo?")
                    .fontWeight(.bold)
                    .modifier(Titulos())
                    .padding(.bottom)
                Text("ALEGRIA")
                    .modifier(SubTitulo())
                    WrappingHStack(id: \.self, alignment: .leading) {
                                ForEach(humors, id: \.self) { humor in
                                    Text(humor)
                                        .modifier(Tags())
                                        .padding(3)
                                }
                    }
                    
                
            }
            
        }.padding()
    }
}

struct TagSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TagSelectionView()
    }
}
