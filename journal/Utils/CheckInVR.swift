//
//  CheckInVR.swift
//  journal
//
//  Created by Bruna Naomi Yamanaka Silva on 18/09/21.
//

import Foundation


class CheckInVR: ObservableObject {

    @Published var currentPage: CheckInPage = .moodTrack
    
}

enum CheckInPage {
    case moodTrack
    case tagSelection
    case question1
    case question2
    case rating
}
