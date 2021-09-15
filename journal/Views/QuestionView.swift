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
