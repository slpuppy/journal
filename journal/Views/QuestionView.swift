//
//  QuestionView.swift
//  journal
//
//  Created by Bruna Naomi Yamanaka Silva on 14/09/21.
//

import SwiftUI
import WrappingStack


struct QuestionView: View {
    @State var reflection: String = ""
    @State var reflectionTitle: String = ""
    let humors = ["Amor", "Vigilância", "Pessimismo","Amor", "Vigilância"]
    
    var body: some View {
        VStack(alignment: .leading){
            VStack{
                Text("Como foi seu dia?")
                    .fontWeight(.bold)
                    .modifier(Titulos())
                WrappingHStack(id: \.self, alignment: .leading) {
                            ForEach(humors, id: \.self) { humor in
                                Text(humor)
                                    .modifier(TagUsed())
                                    .padding(3)
                            }
                }
                
            }
            TextField("Título", text: $reflectionTitle)
                .foregroundColor(Color("Preto"))
                .font(.system(size: 22.0))
            TextField("Escreva aqui...", text: $reflection)
                .font(.system(size: 16.0))
                .foregroundColor(Color("Preto"))
            Spacer()
            
        }.padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
    
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
