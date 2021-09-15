//
//  CreditsView.swift
//  journal
//
//  Created by Alessandra Fernandes Lacerda on 14/09/21.
//

import SwiftUI

struct CreditsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Text("Créditos")
            Button("Retornar") {
                presentationMode.wrappedValue.dismiss()
            }
        }.ignoresSafeArea()
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
