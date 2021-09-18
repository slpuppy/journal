//
//  CheckInView.swift
//  journal
//
//  Created by Bruna Naomi Yamanaka Silva on 18/09/21.
//

import SwiftUI

struct CheckInView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ProgressBarView(value: 1)
        MoodTrackerView()
    }
}

struct CheckInView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInView()
    }
}
