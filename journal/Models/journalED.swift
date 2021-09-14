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

class Journal: Codable {
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
    
    static var shared = [Journal]()
    
    static func saveJournal(_ journal: Journal){
        self.shared.append(journal)
    }
}

enum QuestionType: String, Codable {
    case inicio
    case meio
    case fim
}

class Question: Codable {
    
    static var shared = [Question]()
    
    var ID = UUID()
    let text: String
    let type: QuestionType
    
    init(text: String, type: QuestionType) {
        self.text = text
        self.type = type
    }
    
    static func sharedInit(){
        self.shared.append(
            Question(text: "Como foi seu dia?", type: .inicio)
        )
        self.shared.append(
            Question(text: "O que te fez se sentir assim?", type: .meio)
        )
        self.shared.append(
            Question(text: "O que você faria para melhorar?", type: .fim)
        )
    }
}

class Feeling: Codable {
    static var shared = [Feeling]()
    var ID = UUID()
    let tag: String
    let text: String
    let type: FeelingType
    
    init(tag: String, type: FeelingType) {
        self.tag = tag
        self.type = type
        self.text = ""
    }
    
    static func addFeeling(tag: String, type: FeelingType){
            self.shared.append(
                Feeling(tag: "amoros@", type: .alegria)
            )
    }
    
    static func sharedInit(){
        addFeeling(tag: "amoros@", type: .alegria)
        addFeeling(tag: "otimista", type: .alegria)
        addFeeling(tag: "extasiad@", type: .alegria)
        addFeeling(tag: "alegre", type: .alegria)
        addFeeling(tag: "seren@", type: .alegria)
        addFeeling(tag: "luto", type: .tristeza)
        addFeeling(tag: "triste", type: .tristeza)
        addFeeling(tag: "melancolic@", type: .tristeza)
        addFeeling(tag: "descepcionad@", type: .tristeza)
        addFeeling(tag: "interessad@", type: .antecipacao)
        addFeeling(tag: "ansios@", type: .antecipacao)
        addFeeling(tag: "vigilante", type: .antecipacao)
        addFeeling(tag: "maravilhad@", type: .surpresa)
        addFeeling(tag: "surpres@", type: .surpresa)
        addFeeling(tag: "distraid@", type: .surpresa)
        addFeeling(tag: "repugnancia", type: .nojo)
        addFeeling(tag: "enojad@", type: .nojo)
        addFeeling(tag: "entediad@", type: .nojo)
        addFeeling(tag: "adminirad@", type: .confianca)
        addFeeling(tag: "confiante", type: .confianca)
        addFeeling(tag: "aceit@", type: .confianca)
        addFeeling(tag: "irad@", type: .raiva)
        addFeeling(tag: "irritad@", type: .raiva)
        addFeeling(tag: "aborrecid@", type: .raiva)
        addFeeling(tag: "aterrorizad@", type: .medo)
        addFeeling(tag: "medo", type: .medo)
        addFeeling(tag: "apreenciv@", type: .medo)
        addFeeling(tag: "intimidad@", type: .medo)
        addFeeling(tag: "culpad@", type: .outros)
        addFeeling(tag: "orgulhos@", type: .outros)
        addFeeling(tag: "desesperad@", type: .outros)
        addFeeling(tag: "inveja", type: .outros)
        addFeeling(tag: "pessimista", type: .outros)
        addFeeling(tag: "apatic@", type: .outros)
    }
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
