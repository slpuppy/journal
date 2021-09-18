//
//  FeelingTextEditSheet.swift
//  journal
//
//  Created by Gabriel Puppi on 18/09/21.
//

import SwiftUI

struct FeelingTextEditSheet: View {
   
    @StateObject var model: Feeling
    
    @EnvironmentObject var controller: JournalController
    
    @State var editing: Bool = false
   
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack{
            HStack{
                
                
                Image(systemName: "chevron.left")
                    .foregroundColor(Color("Roxão dark"))
                    .onTapGesture {
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                 Text(model.tag)
                    .font(.system(size: 20,
                                  weight: .semibold,
                                  design: .default))
                    .foregroundColor(Color("Roxão dark"))
                   
                Spacer()
                
            }.padding()
            
        
                
            
                
         
            
            TextEditor(text: $model.text)
                .background(Color("CinzaBG"))
                .cornerRadius(20)
                
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .font(.system(size: 16,
                              weight: .regular,
                              design: .default))
                .foregroundColor(Color("Cinza rating"))
                .onTapGesture {
                    
                    self.editing = true
                }
                .fixedSize(horizontal: false, vertical: false) 
            
            
            Button(action: {
            
                self.presentationMode.wrappedValue.dismiss()
                
                controller.updateFeelingInfo(model: model)
                
                
            
            
            }, label: {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color("Roxão dark"))
                    Text("Atualizar sentimento")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold, design: .default))
                }.frame(height: 60)
                
            })
                
                .padding()
          
            
                
        }.background(Color("BackgroundColor"))
        
        
       

    }
}

struct FeelingTextEditSheet_Previews: PreviewProvider {
    static var previews: some View {
        FeelingTextEditSheet(model: Feeling(tag: "Amor", text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.", type: .outros, isExpanded: false))
    }
}
