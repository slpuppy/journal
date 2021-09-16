//
//  ProfileView.swift
//  journal
//
//  Created by Alessandra Fernandes Lacerda on 14/09/21.
//

import SwiftUI
import Liquid

struct ProfileView: View {

    var body: some View {
        Spacer()
        ScrollView{
            VStack{
                
                UsernameEditView()
                Spacer()
                
                StatsView()

                Spacer()
                
                NotificationSettingsView()
                
                Spacer()
                
                ExtrasView()
                
            }.padding()
            
        }
        
    }
}


struct UsernameEditView: View {
    
    @State var username: String = "Joãozinho"
    @State var disableNameEditing: Bool = true
    
    var body: some View {
        HStack{
            TextField("", text: $username)
                .font(.title)
                .foregroundColor(Color("Cinzão"))
                .disabled(disableNameEditing)
                
            Spacer()
            
            Image(systemName: disableNameEditing ? "pencil" : "checkmark")
                .font(.title2)
                .foregroundColor(disableNameEditing ? Color(.gray) : Color("AzulEscuro"))
                .onTapGesture {
                    disableNameEditing.toggle()
                }
            
        }.padding()
        .frame(maxWidth: .infinity)
        .background(disableNameEditing ? Color(.clear) : Color(.white))
        .cornerRadius(12)
        .shadow(radius: disableNameEditing ? 0 : 3)
        .padding(.bottom)
    }
}

struct StatsView: View {
    
    var checkins: Int = 30
    var discoveredEmotions: Int = 20
    var writtenEmotions: Int = 10
    
    var body: some View {
        VStack{
            HStack{
                ZStack{
                    Liquid(samples: 6, period: 3)
                        .foregroundColor(Color("LaranjaCheckin"))
                    Text("\(checkins)")
                        .foregroundColor(Color("AzulEscuro"))
                        .bold()
                }.frame(width: 45, height: 45)
                
                VStack(alignment: .leading){
                    Text("Check-ins realizados")
                        .font(.title3)
                        .foregroundColor(Color("Cinzão"))
                        .fontWeight(.medium)
                    Text("Último check-in em 21/09/2021")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
            }.padding(.top)

            HStack{
                ZStack{
                    Liquid(samples: 6, period: 3)
                        .foregroundColor(Color("VerdeCollection"))
                    Text("\(discoveredEmotions)")
                        .foregroundColor(Color("AzulEscuro"))
                        .bold()
                }.frame(width: 45, height: 45)
                VStack(alignment: .leading){
                    Text("Emoções descobertas")
                        .font(.title3)
                        .foregroundColor(Color("Cinzão"))
                        .fontWeight(.medium)
                }
                Spacer()
            }.padding(.top)

            HStack{
                ZStack{
                    Liquid(samples: 6, period: 3).foregroundColor(Color("TabBarPurple"))
                    Text("\(writtenEmotions)").foregroundColor(Color("AzulEscuro")).bold()
                }.frame(width: 45, height: 45)
                VStack(alignment: .leading){
                    Text("Emoções aprofundadas").font(.title3).foregroundColor(Color("Cinzão")).fontWeight(.medium)
                }
                Spacer()
            }.padding(.top).padding(.bottom)

        }.padding()
        .frame(maxWidth: .infinity)
        .background(Color(.white))
        .cornerRadius(12)
        .shadow(radius: 3)
        .padding(.bottom)
    }
}

struct NotificationSettingsView: View {
    
    @State private var turnOnNotifications = false
    @State private var notificationTime = Date()
    
    var body: some View {
        VStack{
            Toggle("Notificações", isOn: $turnOnNotifications)
                .foregroundColor(Color("AzulEscuro"))
                .font(.system(size: 20, weight: .medium))
            
            if turnOnNotifications {
                HStack{
                    DatePicker("Horário do lembrete",
                               selection: $notificationTime,
                               displayedComponents: [.hourAndMinute])
                        .foregroundColor(Color("Cinzão"))
                        .font(.system(size: 16 ,weight: .medium))
                }
            }
            
        }.padding()
        .frame(maxWidth: .infinity)
        .background(Color(.white))
        .cornerRadius(12)
        .shadow(radius: 3)
        .padding(.bottom)
    }
    
}

struct ExtrasView: View {
    
    @State private var creditsIsPresented = false
    @State private var feedbacksIsPresented = false
    @State private var privacyIsPresented = false
    
    var body: some View {
        VStack{
        
            HStack{
                Text("Créditos")
                    .foregroundColor(Color("AzulEscuro"))
                    .font(.system(size: 20, weight: .medium))
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }.onTapGesture {
                creditsIsPresented.toggle()
            }
        
            Divider()
            
            HStack{
                Text("Feedbacks")
                    .foregroundColor(Color("AzulEscuro"))
                    .font(.system(size: 20, weight: .medium))
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }.onTapGesture {
                feedbacksIsPresented.toggle()
            }
            
            Divider()
            
            HStack{
                Text("Privacidade")
                    .foregroundColor(Color("AzulEscuro"))
                    .font(.system(size: 20, weight: .medium))
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }.onTapGesture {
                privacyIsPresented.toggle()
            }
        
        }.padding()
        .frame(maxWidth: .infinity)
        .background(Color(.white))
        .cornerRadius(12)
        .shadow(radius: 3)
        .fullScreenCover(isPresented: $creditsIsPresented, content: CreditsView.init)
        .fullScreenCover(isPresented: $feedbacksIsPresented, content: FeedbacksView.init)
        .fullScreenCover(isPresented: $privacyIsPresented, content: PrivacyView.init)
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
