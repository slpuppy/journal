//
//  ProgressBar.swift
//  journal
//
//  Created by Bruna Naomi Yamanaka Silva on 09/09/21.
//

import SwiftUI

struct ProgressBarView: View {
    var value: Int
    var maximum: Int = 5
    var height: CGFloat = 5
    var spacing: CGFloat = 4
    var selectedColor: Color = Color("Rosinha")
    var unselectedColor: Color = .gray.opacity(0.3)
    
    var body: some View {
        HStack(spacing: spacing){
            ForEach(0 ..< maximum) { index in
                Rectangle()
                    .cornerRadius(8)
                    .foregroundColor(index < self.value ? self.selectedColor : self.unselectedColor)
            }
        }
        .frame(maxHeight: height)
        .padding(.horizontal, 20)
        .padding(.vertical, 4)
        //.background(Color("BackgroundColor").ignoresSafeArea())
    }

}
struct ExampleOfProgress: View {
  @State var value = 0
  var body: some View {
    VStack(alignment: .leading) {
      ProgressBarView(value: value)
        .animation(.default)
        .padding(.vertical)
      Button(action: {
        self.value = (self.value + 1) % (5 + 1)
      }) {
        Text("Increment value")
      }
    }
    .padding()
  }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleOfProgress()
        //ProgressBarView()
    }
}

