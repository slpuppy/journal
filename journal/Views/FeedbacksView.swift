//
//  FeedbacksView.swift
//  journal
//
//  Created by Alessandra Fernandes Lacerda on 14/09/21.
//

import SwiftUI

struct FeedbacksView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Text("Feedbacks")
            Button("Retornar") {
                presentationMode.wrappedValue.dismiss()
            }
        }.ignoresSafeArea()
    }
}

struct FeedbacksView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbacksView()
    }
}
