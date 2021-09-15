//
//  journalED.swift
//  journal
//
//  Created by Paulo Tadashi Tokikawa on 13/09/21.
//

import Foundation

enum ResultMood: String, Codable {
    case pior
    case igual
    case melhor
    case indefinido
}

class Journal: Codable, Identifiable {
    var ID = UUID()
    var mood: Int
    var date: Date
    var afterMood: ResultMood
    var dailyTexts = [DailyTexts]()
    var feelings = [Feeling]()
    
    class DailyTexts: Codable {
        var ID = UUID()
        var question: Question
        var text: String
        
        init(question: Question, awnser: String) {
            self.question = question
            self.text = awnser
        }
    }
    
    init(initialMood: Int) {
        mood = initialMood
        date = Date()
        afterMood = .indefinido
    }
    
    public func addText(question: Question, awnser: String){
        let text = DailyTexts(question: question, awnser: awnser)
        dailyTexts.append(text)
    }
    
    public func addFeelings(feelings: [Feeling]){
        self.feelings = feelings
    }
    
    public func setAfterMood(_ afterMood: ResultMood){
        self.afterMood = afterMood
    }
    
   
}


enum QuestionType: String, Codable {
    case inicio
    case meio
    case fim
}

class Question: Codable, Identifiable {
    
    static var shared = [
        Question(text: "Como foi seu dia?", type: .inicio),
        Question(text: "O que te fez se sentir assim?", type: .meio),
        Question(text: "O que você faria para melhorar?", type: .fim)
    ]
    
    var ID = UUID()
    let text: String
    let type: QuestionType
    
    init(text: String, type: QuestionType) {
        self.text = text
        self.type = type
    }
}

class Feeling:  Codable, Identifiable {

    var ID = UUID()
    let tag: String
    let text: String
    let type: FeelingType
    
    init(tag: String, type: FeelingType) {
        self.tag = tag
        self.type = type
        self.text = ""
    }
    
    static var shared = [
        Feeling(tag: "amoros@", type: .alegria),
        Feeling(tag: "otimista", type: .alegria),
        Feeling(tag: "extasiad@", type: .alegria),
        Feeling(tag: "alegre", type: .alegria),
        Feeling(tag: "seren@", type: .alegria),
        Feeling(tag: "luto", type: .tristeza),
        Feeling(tag: "triste", type: .tristeza),
        Feeling(tag: "melancolic@", type: .tristeza),
        Feeling(tag: "descepcionad@", type: .tristeza),
        Feeling(tag: "interessad@", type: .antecipacao),
        Feeling(tag: "ansios@", type: .antecipacao),
        Feeling(tag: "vigilante", type: .antecipacao),
        Feeling(tag: "maravilhad@", type: .surpresa),
        Feeling(tag: "surpres@", type: .surpresa),
        Feeling(tag: "distraid@", type: .surpresa),
        Feeling(tag: "repugnancia", type: .nojo),
        Feeling(tag: "enojad@", type: .nojo),
        Feeling(tag: "entediad@", type: .nojo),
        Feeling(tag: "adminirad@", type: .confianca),
        Feeling(tag: "confiante", type: .confianca),
        Feeling(tag: "aceit@", type: .confianca),
        Feeling(tag: "irad@", type: .raiva),
        Feeling(tag: "irritad@", type: .raiva),
        Feeling(tag: "aborrecid@", type: .raiva),
        Feeling(tag: "aterrorizad@", type: .medo),
        Feeling(tag: "medo", type: .medo),
        Feeling(tag: "apreenciv@", type: .medo),
        Feeling(tag: "intimidad@", type: .medo),
        Feeling(tag: "culpad@", type: .outros),
        Feeling(tag: "orgulhos@", type: .outros),
        Feeling(tag: "desesperad@", type: .outros),
        Feeling(tag: "inveja", type: .outros),
        Feeling(tag: "pessimista", type: .outros),
        Feeling(tag: "apatic@", type: .outros)
    ]
}

enum FeelingType: String, Codable {
    case alegria
    case tristeza
    case antecipacao
    case surpresa
    case nojo
    case confianca
    case raiva
    case medo
    case outros
}
