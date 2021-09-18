//
//  FeelingsCollection.swift
//  journal
//
//  Created by Gabriel Puppi on 13/09/21.
//

import SwiftUI

struct FeelingsCollectionTableView: View {
    
    @ObservedObject var dataSource = ListDataSource()
    
    var body: some View {
        
        ScrollView{
            LazyVStack {
                ForEach(dataSource.rowModels) { model in
                    FeelingRow(model: model)
                }.padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding(.trailing, 10)
            }.background(Color("BackgroundColor"))
        }
    }
}

struct FeelingRow: View {
    
    @State var model: Feeling
    
    var body: some View{
        
        VStack(alignment: .leading) {
            
            Button(action: {
                self.model.isExpanded.toggle()
            }) {
                ZStack{
                    Color.white
                    VStack {
                        HStack {
                            Image(systemName: "seal").foregroundColor(Color("Roxão dark"))
                            Text(model.tag)
                                .foregroundColor(Color("Roxão dark"))
                                .font(.system(size: 20, weight: .medium, design: .default))
                                .lineLimit(nil)
                                .padding(.top, 5)
                                .padding(.bottom, 5)
                            Spacer()
                            Image(systemName: "chevron.down").foregroundColor(Color("Roxão dark"))
                        }.padding()
                        
                        if model.isExpanded {
                            VStack(alignment: .leading){
                                Text(model.text)
                                    .lineLimit(nil)
                                    .font(.system(size: 16, weight: .regular, design: .default))
                                    .foregroundColor(Color("Cinza rating"))
                                    .padding(.bottom, 5)
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                                
                                Button(action: { return }, label: {
                                    Text("+ Descrever este sentimento")
                                        .font(.system(size: 14, weight: .regular, design: .default))
                                        .foregroundColor(Color("Roxão dark"))
                                        .padding(.leading, 20)
                                        .padding(.bottom, 20)
                                })
                                ZStack {
                                    Rectangle().foregroundColor(Color("CinzaBG"))
                                    
                                    VStack {
                                        Button(action: {return}, label: {
                                            ZStack {
                                                Rectangle().foregroundColor(Color("Roxão dark"))
                                                Text("Me aprofundar nessa emoção").foregroundColor(.white)
                                                    .font(.system(size: 15, weight: .semibold, design: .default))
                                                    .padding()
                                            }
                                            .cornerRadius(8.5)
                                            .padding(.leading, 60)
                                            .padding(.trailing, 60)
                                            .padding(.top, 30)
                                            .padding(.bottom, 30)
                                        })
                                        
                                        HStack {
                                            Text("Você marcou amor 0 vezes no seu diário.")
                                                .font(.system(size: 14, weight: .regular, design: .default))
                                                .foregroundColor(.gray)
                                                .padding(.leading, 20)
                                            Spacer()
                                        }
                                        HStack {
                                            Text("Visualizar histórico")
                                                .font(.system(size: 14, weight: .regular, design: .default))
                                                .foregroundColor(Color("Roxão dark"))
                                                .padding(.top, 5)
                                                .padding(.bottom, 20)
                                                .padding(.leading, 20)
                                            Spacer()
                                        }
                                    }
                                }
                            }
                        } else {
                            EmptyView()
                        }
                    }
                }.cornerRadius(15)
                .shadow(color: Color(.black).opacity(0.1), radius: 13, x: 0.0, y: 4.0)
                
            }
            
            
        }
        
    }
}

struct FeelingsCollection_Previews: PreviewProvider {
    static var previews: some View {
        FeelingsCollectionTableView()
    }
}






