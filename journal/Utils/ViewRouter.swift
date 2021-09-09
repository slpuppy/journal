//
//  ViewRouter.swift
//  journal
//
//  Created by Alessandra Fernandes Lacerda on 09/09/21.
//

import Foundation

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .home
    
    
}

enum Page {
    case home
    case newEntry
    case yourJourney
}
