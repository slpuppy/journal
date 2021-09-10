//
//  TabBar.swift
//  journal
//
//  Created by Alessandra Fernandes Lacerda on 09/09/21.
//

import SwiftUI
import Liquid

struct TabBarIcon: View {
    
    let systemIconName, tabName: String
    let width, height: CGFloat
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page

    
    var body: some View {
        VStack{
            VStack{
                ZStack{
                    BlobTabBar(height: height*1.60, opacity: viewRouter.currentPage == assignedPage ? 1 : 0).animation(.easeIn(duration: 0.5))
                    Image(systemName: systemIconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width, height: height)
                        
                }.padding(.top, 10)
                
                
                Text(tabName)
                    .font(.footnote).padding(.top, -5)
                    .opacity(viewRouter.currentPage == assignedPage ? 1 : 0)
                    .animation(.easeIn(duration: 0.5))
            }
            Spacer()
        }.foregroundColor(viewRouter.currentPage == assignedPage ? Color("AzulEscuro") : .gray)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
    }
}

struct BlobTabBar: View {

    var height: CGFloat
    var opacity: Double = 1

    var body: some View {
        Liquid(samples: 6, period: 3)
            .aspectRatio(contentMode: .fit)
            .frame(height: height)
            .foregroundColor(Color("TabBarPurple"))
            .opacity(opacity)
    }
    
    var animatableData: Double {
        get { opacity }
        set { opacity = newValue }
    }
}

struct TabBar: View {
    
    @StateObject var viewRouter: ViewRouter
    @State var button: CGFloat = 1
    
    var body: some View {
        
        GeometryReader {geometry in
            HStack {
                Spacer()
                TabBarIcon(systemIconName: "house", tabName: "Início", width: geometry.size.width / 7, height: geometry.size.height/4, viewRouter: viewRouter, assignedPage: .home)
                Spacer()
                TabBarIcon(systemIconName: "books.vertical", tabName: "Coleção", width: geometry.size.width / 7, height: geometry.size.height/4, viewRouter: viewRouter, assignedPage: .colection)
                Spacer()
                TabBarIcon(systemIconName: "clock.arrow.circlepath", tabName: "Histórico", width: geometry.size.width / 7, height: geometry.size.height/4, viewRouter: viewRouter, assignedPage: .history)
                Spacer()
                TabBarIcon(systemIconName: "person.crop.circle", tabName: "Perfil", width: geometry.size.width / 7, height: geometry.size.height/4, viewRouter: viewRouter, assignedPage: .profile)
                
                Spacer()
            }.background(Color(.white).shadow(radius: 3))
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(viewRouter: ViewRouter())
    }
}
