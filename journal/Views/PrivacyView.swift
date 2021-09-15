//
//  PrivacyView.swift
//  journal
//
//  Created by Alessandra Fernandes Lacerda on 14/09/21.
//

import SwiftUI

struct PrivacyView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Text("Privacidade")
            Button("Retornar") {
                presentationMode.wrappedValue.dismiss()
            }
        }.ignoresSafeArea()
    }
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
