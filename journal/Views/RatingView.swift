//
//  RatingView.swift
//  journal
//
//  Created by Bruna Naomi Yamanaka Silva on 14/09/21.
//

import SwiftUI
import Liquid

struct RatingView: View {
    @EnvironmentObject var controller: JournalController
    @Environment(\.presentationMode) var presentationMode
    @State var blob = 0
    var body: some View {
        VStack(){
            Text("Como você está se sentindo depois de escrever?")
                .fontWeight(.bold)
                .modifier(Titulos())
            Spacer()
            HStack{
                switch blob{
                case 1:
                    blobPiorTapped()
                    blobIgual().onTapGesture {
                        blob = 2
                    }
                    blobMelhor().onTapGesture {
                        blob = 3
                    }
                case 2:
                    blobPior().onTapGesture {
                        blob = 1
                    }
                    blobIgualTapped()
                    blobMelhor().onTapGesture {
                        blob = 3
                    }
                case 3:
                    blobPior().onTapGesture {
                        blob = 1
                    }
                    blobIgual().onTapGesture {
                        blob = 2
                    }
                    blobMelhorTapped()
                    
                default:
                    blobPior().onTapGesture {
                        blob = 1
                    }
                    blobIgual().onTapGesture {
                        blob = 2
                    }
                    blobMelhor().onTapGesture {
                        blob = 3
                    }
                }
            }
            Spacer()
            ZStack{
                Circle()
                    .foregroundColor(Color("Roxão dark"))
                Image(systemName: "checkmark")
                    .font(.system(size: 20.0))
                    .foregroundColor(.white)
            }
            .frame(width: 60, height: 60)
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
                switch blob{
                case 1:
                    controller.currentAfterMood = .pior
                case 2:
                    controller.currentAfterMood = .igual
                case 3:
                    controller.currentAfterMood = .melhor
                default:
                    controller.currentAfterMood = .indefinido
                }
                controller.currentJournal!.afterMood = controller.currentAfterMood
                controller.saveJournal(controller.currentJournal!)
            }
            .padding(.bottom)
        }.padding(.top)
        
    }
}
struct blobPior: View {
    var body: some View{
        VStack{
            ZStack{
                Circle()
                    .foregroundColor(Color.white)
                Liquid(samples: 5, period: 5).frame(width: 90, height: 90)
                    .foregroundColor(Color("Azul Rating"))
                Line(start: CGPoint(x: 30, y: 52), end: CGPoint(x: 70, y: 52), control: CGPoint(x: 50, y: 40))
                    .stroke(style:StrokeStyle(lineWidth: 5.0, lineCap: .round)).foregroundColor(.white)
                        
            }.frame(width: 104, height: 104)
            Text("Pior")
                .font(.system(size: 15.0))
                .foregroundColor(.gray)
        }
        
    }
}
struct blobPiorTapped: View {
    var body: some View{
        VStack{
            ZStack{
                Circle()
                    .foregroundColor(Color.white)
                Circle()
                    .stroke(Color("AzulEscuro"), lineWidth: 2)
                Liquid(samples: 5, period: 5).frame(width: 90, height: 90)
                    .foregroundColor(Color("Azul Rating"))
                Line(start: CGPoint(x: 30, y: 52), end: CGPoint(x: 70, y: 52), control: CGPoint(x: 50, y: 40))
                    .stroke(style:StrokeStyle(lineWidth: 5.0, lineCap: .round)).foregroundColor(.white)
                        
            }.frame(width: 104, height: 104)
            Text("Pior")
                .font(.system(size: 15.0))
                .foregroundColor(.gray)
        }
        
    }
}
struct blobIgual: View {
    var body: some View{
        VStack{
            ZStack{
                Circle()
                    .foregroundColor(Color.white)
                Liquid(samples: 6, period: 5).frame(width: 90, height: 90)
                    .foregroundColor(Color("Cinza Rating"))
                Line(start: CGPoint(x: 30, y: 52), end: CGPoint(x: 70, y: 52), control: CGPoint(x: 50, y: 52))
                    .stroke(style:StrokeStyle(lineWidth: 5.0, lineCap: .round)).foregroundColor(.white)
                        
            }.frame(width: 104, height: 104)
            Text("Igual")
                .font(.system(size: 15.0))                .foregroundColor(.gray)
        }
        
    }
}
struct blobIgualTapped: View {
    var body: some View{
        VStack{
            ZStack{
                Circle()
                    .foregroundColor(Color.white)
                Circle()
                    .stroke(Color("AzulEscuro"), lineWidth: 2)
                Liquid(samples: 6, period: 5).frame(width: 90, height: 90)
                    .foregroundColor(Color("Cinza Rating"))
                Line(start: CGPoint(x: 30, y: 52), end: CGPoint(x: 70, y: 52), control: CGPoint(x: 50, y: 52))
                    .stroke(style:StrokeStyle(lineWidth: 5.0, lineCap: .round)).foregroundColor(.white)
                        
            }.frame(width: 104, height: 104)
            Text("Igual")
                .font(.system(size: 15.0))                .foregroundColor(.gray)
        }
        
    }
}

struct blobMelhor: View {
    var body: some View{
        VStack{
            ZStack{
                Circle()
                    .foregroundColor(Color.white)
                
                Liquid(samples: 7, period: 5).frame(width: 90, height: 90)
                    .foregroundColor(Color("Laranja Rating"))
                Line(start: CGPoint(x: 30, y: 52), end: CGPoint(x: 70, y: 52), control: CGPoint(x: 50, y: 65))
                    .stroke(style:StrokeStyle(lineWidth: 5.0, lineCap: .round)).foregroundColor(.white)
                        
            }.frame(width: 104, height: 104)
            Text("Melhor")
                .font(.system(size: 15.0))
                .foregroundColor(.gray)
        }
        
    }
}
struct blobMelhorTapped: View {
    var body: some View{
        VStack{
            ZStack{
                Circle()
                    .foregroundColor(Color.white)
                Circle()
                    .stroke(Color("AzulEscuro"), lineWidth: 2)
                
                Liquid(samples: 7, period: 5).frame(width: 90, height: 90)
                    .foregroundColor(Color("Laranja Rating"))
                Line(start: CGPoint(x: 30, y: 52), end: CGPoint(x: 70, y: 52), control: CGPoint(x: 50, y: 65))
                    .stroke(style:StrokeStyle(lineWidth: 5.0, lineCap: .round)).foregroundColor(.white)
                        
            }.frame(width: 104, height: 104)
            Text("Melhor")
                .bold()
                .font(.system(size: 15.0))
                .foregroundColor(.gray)
        }
        
    }
}



struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
    }
}
