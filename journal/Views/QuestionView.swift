//
//  QuestionView.swift
//  journal
//
//  Created by Bruna Naomi Yamanaka Silva on 14/09/21.
//

import SwiftUI


struct QuestionView: View {
    @State var reflection: String = ""
    @State var reflectionTitle: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            VStack{
                Text("Como foi seu dia?")
                    .modifier(Titulos())
                HStack{
                    Text("Amor")
                        .modifier(TagUsed())
                    Text("Vigilância")
                        .modifier(TagUsed())
                    Text("Pessimismo")
                        .modifier(TagUsed())
                        
                }.padding(.bottom, 30)
                
            }
            TextField("Título", text: $reflectionTitle)
                .font(.custom("SF Pro Display", size: 22))
                .foregroundColor(Color("Preto"))
            TextField("Escreva aqui...", text: $reflection)
                .font(.custom("SF Pro Text Regular", size: 16))
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
