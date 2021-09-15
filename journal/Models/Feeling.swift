//
//  Feeling.swift
//  journal
//
//  Created by Gabriel Puppi on 15/09/21.
//

import Foundation



struct Feeling: Identifiable {
 
  
        
        var id = UUID()
        var name: String
        var detail: String
        var isExpanded: Bool
        
    
    
    internal init(name: String, detail: String, isExpanded: Bool) {
        self.name = name
        self.detail = detail
        self.isExpanded = isExpanded
        
    }
    
    
    }
