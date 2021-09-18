//
//  CheckInView.swift
//  journal
//
//  Created by Bruna Naomi Yamanaka Silva on 18/09/21.
//

import SwiftUI

//struct CheckInView: View {
//    @Environment(\.presentationMode) var presentationMode
//
//    var body: some View {
//
//        ProgressBarView(value: 1)
//        MoodTrackerView()
//    }
//}

//struct CheckInView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckInView()
//    }
//}
struct abubleView: View {
    @StateObject var checkInVR = CheckInVR()
    var body: some View{
        CheckInView(viewRouter: checkInVR)
    }
}
struct CheckInView: View {
    @EnvironmentObject var controller: JournalController
    @StateObject var viewRouter: CheckInVR
    @State var value : Int = 0
    
    var body: some View {
        VStack{
            ProgressBarView(value: value)
                VStack(){
                    switch viewRouter.currentPage {
                    case .moodTrack:
                        MoodTrackerView()
                    case .tagSelection:
                        TagSelectionView()
                    case .question1:
                        QuestionView()
                    case .question2:
                        QuestionView()
                    case .rating:
                        RatingView()
                    }
                    
                    
                }
                //MoodTrackerView()
        }.background(Color("BackgroundColor").ignoresSafeArea())
        
        
    }
}
