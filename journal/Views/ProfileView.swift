//
//  ProfileView.swift
//  journal
//
//  Created by Alessandra Fernandes Lacerda on 14/09/21.
//

import SwiftUI
import Liquid

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
                    Text("Último check-in em 212/09/2021")
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

struct ProfileView: View {

    var body: some View {
        ScrollView{
            VStack{
                
                Spacer()
                
                StatsView()

                Spacer()
                
            }.padding()
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}