//
//  TagSelectionView.swift
//  journal
//
//  Created by Bruna Naomi Yamanaka Silva on 09/09/21.
//

import SwiftUI

struct TagSelectionView: View {

    @State var reflection: String = ""
    @State var reflectionTitle: String = ""
    
    var body: some View {
    
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text("O que você está sentindo?")
                    .modifier(Titulos())
                    .padding(.bottom)
                Text("ALEGRIA")
                    .modifier(SubTitulo())
                HStack{
                    Text("Amor")
                        .modifier(Tags())
                    Text("Vigilância")
                        .modifier(TagSelected())
                    Text("Pessimismo")
                        .modifier(Tags())
                        
                }.padding(.bottom, 10)
                
                
            }
            
        }.padding()
    }
}

struct TagSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TagSelectionView()
    }
}
