//
//  QuestionView.swift
//  journal
//
//  Created by Bruna Naomi Yamanaka Silva on 14/09/21.
//

import SwiftUI
import WrappingStack


struct QuestionView: View {
    @EnvironmentObject var controller: JournalController
    @State var reflection: String = "Escreva aqui..."
    @State var reflectionTitle: String = ""
    //let humors = ["Amor", "Vigilância", "Pessimismo","Amor", "Vigilância"]
    init() {
            UITextView.appearance().backgroundColor = .clear
        }

    
    var body: some View {
        VStack(alignment: .leading){
            VStack{
                Text("Como foi seu dia?")
                    .fontWeight(.bold)
                    .modifier(Titulos())
                WrappingHStack(alignment: .leading) {
                    ForEach(controller.currentFeelings) { feeling in
                        Text(feeling.tag)
                            .modifier(TagUsed())
                            .padding(3)
                    }
                }
                
            }
            TextField("Título", text: $reflectionTitle)
                .foregroundColor(Color("Preto"))
                .font(.system(size: 22.0))
            TextEditor(text: $reflection)
                .background(Color.clear)
                .font(.system(size: 16.0))
                .foregroundColor(Color("Preto"))
                
            
            Spacer()
            
        }.padding(.horizontal, 20)
        .padding(.vertical, 10)
        .onChange(of: reflection, perform: { value in
            controller.currentText = value
        })
        .onChange(of: reflectionTitle, perform: { value in
            controller.currentTitle = value
        })
    }
}

struct QuestionView2: View {
    @EnvironmentObject var controller: JournalController
    @State var reflection: String = "Escreva aqui..."
    @State var reflectionTitle: String = ""
    init() {
            UITextView.appearance().backgroundColor = .clear
        }

    
    var body: some View {
        VStack(alignment: .leading){
            VStack{
                Text("O que te fez sentir essas emoções?")
                    .fontWeight(.bold)
                    .modifier(Titulos())
                WrappingHStack(alignment: .leading) {
                    ForEach(controller.currentFeelings) { feeling in
                        Text(feeling.tag)
                            .modifier(TagUsed())
                            .padding(3)
                    }
                }
                
            }
            TextField("Título", text: $reflectionTitle)
                .foregroundColor(Color("Preto"))
                .font(.system(size: 22.0))
            TextEditor( text: $reflection)
                .background(Color.clear)
                .font(.system(size: 16.0))
                .foregroundColor(Color("Preto"))
                
            Spacer()
            
        }.padding(.horizontal, 20)
        .padding(.vertical, 10)
        .onChange(of: reflection, perform: { value in
            controller.currentText = value
        })
        .onChange(of: reflectionTitle, perform: { value in
            controller.currentTitle = value
        })
    }
    
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
