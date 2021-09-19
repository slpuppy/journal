import SwiftUI

struct FeelingsCollectionTableView: View {
    
 
    
    var category: FeelingType
    
    var controller = JournalController()
    
    var body: some View {
        
        ScrollView{
            LazyVStack {
                ForEach(controller.feelings.filter({ $0.type == category})) { model in
                    FeelingRow(model: model)
                    Spacer()
                }
                
            }.background(Color("BackgroundColor"))
        }
    }
}

struct FeelingRow: View {
    
    @StateObject var model: Feeling
    @State private var presentSheet = false
    
    var body: some View{
        
        VStack(alignment: .leading) {
            
            
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
                            
                            
                            
                            ZStack {
                                
                                Text(model.text)
                                    
                                    .font(.system(size: 16,
                                                  weight: .regular,
                                                  design: .default))
                                    .foregroundColor(Color("Cinza rating"))
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                                
                            }
                            
                            
                            
                            
                            ZStack {
                                Rectangle().foregroundColor(Color("CinzaBG"))
                                
                                VStack {
                                    
                                    Button(action: { presentSheet.toggle() }, label: {
                                        ZStack {
                                            Rectangle().foregroundColor(Color("Roxão dark"))
                                            Text("Me aprofundar nessa emoção").foregroundColor(.white)
                                                .font(.system(size: 14, weight: .semibold, design: .default))
                                                .padding()
                                        }
                                        .cornerRadius(8.5)
                                        .padding(.leading, 60)
                                        .padding(.trailing, 60)
                                        .padding(.top, 30)
                                        .padding(.bottom, 30)
                                    }).sheet(isPresented: $presentSheet, content: {
                                        FeelingTextEditSheet(model: model)
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
            .shadow(color: Color(.black).opacity(0.1), radius: 4, x: 0.0, y: 4.0)
            .onTapGesture {
                self.model.isExpanded.toggle()
            }
            
        }
        
        
    }
    
}


struct FeelingsCollection_Previews: PreviewProvider {
    static var previews: some View {
        FeelingsCollectionTableView(category: .alegria)
    }
}







