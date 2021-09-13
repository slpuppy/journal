//
//  HomeView.swift
//  journal
//
//  Created by Alessandra Fernandes Lacerda on 11/09/21.
//

import SwiftUI
import Liquid


struct CheckInCardView: View {
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                ZStack{
                    Liquid(samples: 6, period: 3)
                        .foregroundColor(Color("LaranjaCheckin"))
                        .opacity(0.9)
                        .frame(width: 120, height: 120)
                        .position(x: 60, y: 60)
                        .blendMode(.multiply)
                    Liquid(samples: 6, period: 3)
                        .foregroundColor(Color("AzulCheckin"))
                        .opacity(0.9)
                        .frame(width: 120, height: 120)
                        .position(x: 100, y:100)
                        .blendMode(.multiply)
                    
                }.frame(width: 160, height: 160)
            }
            Text("Quarta, 8 de Setembro")
                .font(.subheadline)
                .foregroundColor(Color("PlaceholderGray"))
            Text("Check-in do dia")
                .font(.title2).bold()
                .foregroundColor(Color("AzulEscuro"))
        }.padding()
        .background(Color(.white))
        .cornerRadius(28)
        .shadow(radius: 4)
        .padding()
    }
}

struct CollectionCardView: View {
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                ZStack{
                    Liquid(samples: 6, period: 3)
                        .foregroundColor(Color("AmareloCollection"))
                        .opacity(0.9)
                        .frame(width: 45, height: 45)
                        .position(x: 20, y: 30)
                        .blendMode(.multiply)
                    Liquid(samples: 6, period: 3)
                        .foregroundColor(Color("VerdeCollection"))
                        .opacity(0.9)
                        .frame(width: 45, height: 45)
                        .position(x: 40, y: 23)
                        .blendMode(.multiply)
                    
                }.frame(width: 70, height: 70)
                .padding(.trailing)
            }
            Text("Descubra")
                .font(.subheadline)
                .foregroundColor(Color("PlaceholderGray"))
            Text("Coleção de Emoções")
                .font(.title2).bold()
                .foregroundColor(Color("AzulEscuro"))
            
            
        }.padding()
        .background(Color(.white))
        .cornerRadius(28)
        .shadow(radius: 4)
        .padding()
    }
}

struct HistoryCardView: View {
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                ZStack{
                    Liquid(samples: 6, period: 3)
                        .foregroundColor(Color("AzulEscuro"))
                        .opacity(0.9)
                        .frame(width: 45, height: 45)
                        .position(x: 23, y: 23)
                        .blendMode(.multiply)
                    Liquid(samples: 6, period: 3)
                        .foregroundColor(Color("CinzaHistorico"))
                        .opacity(0.9)
                        .frame(width: 45, height: 45)
                        .position(x: 40, y: 40)
                        .blendMode(.multiply)
                    
                }.frame(width: 70, height: 70)
                .padding(.trailing)
            }
            Text("Relembre")
                .font(.subheadline)
                .foregroundColor(Color("PlaceholderGray"))
            Text("Histórico")
                .font(.title2).bold()
                .foregroundColor(Color("AzulEscuro"))
            
            
        }.padding()
        .background(Color(.white))
        .cornerRadius(28)
        .shadow(radius: 4)
        .padding()
    }
}


struct HomeView: View {
    var userName: String = "Joãozinho"
    @StateObject var viewRouter: ViewRouter

    
    var body: some View {

        ScrollView{
            VStack{
                HStack{
                    Text("Olá, \(userName)").font(.title).foregroundColor(Color("Cinzão"))
                    Spacer()
                }.padding()
                
                CheckInCardView()
                
                CollectionCardView().onTapGesture {
                    viewRouter.currentPage = .collection
                }
                
                HistoryCardView().onTapGesture {
                    viewRouter.currentPage = .history
                }
                
            }
            
        }
                
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
