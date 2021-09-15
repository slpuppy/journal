//
//  Modifiers.swift
//  journal
//
//  Created by Bruna Naomi Yamanaka Silva on 14/09/21.
//

import SwiftUI
import Liquid

struct Tags: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("SF Pro Text Regular", size: 15))
            .foregroundColor(Color("Roxão dark"))
            .padding(.vertical, 7)
            .padding(.horizontal, 10)
            .overlay(
                RoundedRectangle(cornerRadius: 8.5)
                            .stroke(Color("Roxão dark"), lineWidth: 2)
            )
            
    
    }
}
struct TagSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("SF Pro Text Regular", size: 15))
            .foregroundColor(Color.white)
            .padding(.vertical, 7)
            .padding(.horizontal, 10)
            .background(Color("Roxão dark"))
            .clipShape(RoundedRectangle(cornerRadius: 8.5))
    }
}
struct SubTitulo: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("SF Compact Display", size: 12))
            .foregroundColor(Color.gray)
    }
}
struct Titulos: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("SF Pro Display Bold", size: 28))
            .foregroundColor(Color("Roxão dark"))
    }
}

struct TagUsed: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("SF Pro Text Regular", size: 12))
            .foregroundColor(Color("Roxão dark"))
            .padding(.vertical, 6)
            .padding(.horizontal, 10)
            .background(Color("Cinza Tags"))
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
