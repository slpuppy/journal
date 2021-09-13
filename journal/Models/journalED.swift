//
//  journalED.swift
//  journal
//
//  Created by Paulo Tadashi Tokikawa on 13/09/21.
//

import Foundation

class Journal: Codable {
    let ID: UUID
    var sentimento: [UUID]
    var perguntas: [UUID]
    var mood: Int
    var afterMood: resultado
    enum resultado {
        case pior
        case igual
        case melhor
    }
    
    init() {
    }
}
