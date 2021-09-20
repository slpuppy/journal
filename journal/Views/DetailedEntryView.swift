//
//  DetailedEntryView.swift
//  journal
//
//  Created by Alessandra Fernandes Lacerda on 16/09/21.
//

import SwiftUI
import WrappingStack

struct DetailedEntryView: View {
    var journal: Journal
    var currentYear: String
    
    var body: some View{
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    Text("\(journal.day) de \(journal.month)" + (currentYear != journal.year ? " de \(journal.year)" : ""))
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("AzulEscuro"))
                    
                    Spacer()
                }.padding(.bottom)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("COMO VOCÊ SE SENTIU").font(.caption).foregroundColor(Color("CinzaHistorico"))
                        Image("Mood\(Int(journal.mood/2))")
                    }
                    Spacer()
                }.padding(.bottom)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("EMOÇÕES").font(.caption).foregroundColor(Color("CinzaHistorico"))
                        WrappingHStack(alignment: .leading) {
                            ForEach(journal.feelings){feeling in
                                Text(feeling.tag).modifier(TagUsed()).padding(.trailing,5)
                            }
                        }
                    }
                }.padding(.bottom)
                
                VStack(alignment: .leading){
                    
                    
                    ForEach(journal.dailyTexts){dailyText in
                        VStack(alignment: .leading){
                            Text(dailyText.question.text.uppercased())
                                .font(.caption)
                                .foregroundColor(Color("CinzaHistorico"))
                            Text(dailyText.text)
                                .foregroundColor(Color("Cinzão"))
                        }.padding(.bottom)
                        
                    }
                    
                }
                
            }.padding()
            
            Spacer()
        }.background(Color(.white).ignoresSafeArea())
        
    }
}

//struct DetailedEntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailedEntryView()
//    }
//}
