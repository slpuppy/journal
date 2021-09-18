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
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewRouter = CheckInVR()
    @State var value : Int = 1
    
    var body: some View {
        VStack{
            ProgressBarView(value: value).animation(.default)
                VStack(){
                    switch viewRouter.currentPage {
                    case .moodTrack:
                        MoodTrackerView()
                        CheckButton(buttonColor: Color("AzulEscuro"),
                                    checkColor: Color("Bege")).frame(width: 70, height: 70).onTapGesture {
                                        value = value + 1
                                        viewRouter.currentPage = .tagSelection
                                    }
                    case .tagSelection:
                        TagSelectionView()
                        CheckButton(buttonColor: Color("AzulEscuro"),
                                    checkColor: Color("Bege")).frame(width: 70, height: 70).onTapGesture {
                                        value = value + 1
                                        viewRouter.currentPage = .question1
                                    }
                    case .question1:
                        QuestionView()
                        CheckButton(buttonColor: Color("AzulEscuro"),
                                    checkColor: Color("Bege")).frame(width: 70, height: 70).onTapGesture {
                                        value = value + 1
                                        viewRouter.currentPage = .question2
                                    }
                    case .question2:
                        QuestionView()
                        CheckButton(buttonColor: Color("AzulEscuro"),
                                    checkColor: Color("Bege")).frame(width: 70, height: 70).onTapGesture {
                                        value = value + 1
                                        viewRouter.currentPage = .rating
                                    }
                    case .rating:
                        RatingView()
                    }
                    
                }
        }.background(Color("BackgroundColor").ignoresSafeArea())
        
        
    }
}
