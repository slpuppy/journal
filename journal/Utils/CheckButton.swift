//
//  CheckButton.swift
//  journal
//
//  Created by Alessandra Fernandes Lacerda on 08/09/21.
//

import SwiftUI
import Liquid

struct CheckButton: View {
    var buttonColor: Color
    var checkColor: Color
    
    var body: some View {
        ZStack{
            Liquid(samples: 6, period: 2)
                .foregroundColor(buttonColor)
            Image(systemName: "chevron.right")
                .foregroundColor(checkColor)
        }
    }
}

struct CheckButton_Previews: PreviewProvider {
    static var previews: some View {
        CheckButton(buttonColor: .black, checkColor: .white)
    }
}
