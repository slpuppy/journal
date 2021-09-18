//
//  EntryCard.swift
//  journal
//
//  Created by Alessandra Fernandes Lacerda on 16/09/21.
//

import SwiftUI
import WrappingStack

struct EntryCard: View {
    
    var journal: Journal
    
    var body: some View {
        HStack{
            VStack{
                Text(journal.day)
                    .font(.system(size: 20, weight:.semibold))
                    .foregroundColor(Color("AzulEscuro"))
                Spacer()
                Image("Mood\(journal.mood)")
                Spacer()
            }.padding()
            
            VStack(alignment: . leading){
                WrappingHStack(alignment: .leading) {
                    ForEach(journal.feelings) { feeling in
                        Text(feeling.tag).modifier(TagUsed()).padding(.trailing,5)

                    }
                }
                
                Text(journal.dailyTexts[0].question.text)
                    .fontWeight(.semibold)
                    .padding(.top)
                    .padding(.bottom, 5)
                    .foregroundColor(Color("Cinzão"))
                
                Text(journal.dailyTexts[0].text)
                    .font(.footnote)
                    .lineLimit(3)
                    .foregroundColor(Color("Cinzão"))
                
            }.padding()
            
        }
        .frame(maxWidth: .infinity)
        .background(Color(.white))
        .cornerRadius(12)
        .shadow(radius: 3)
        .padding(.bottom)
    }
}

//struct EntryCard_Previews: PreviewProvider {
//    static var previews: some View {
//        EntryCard()
//    }
//}
