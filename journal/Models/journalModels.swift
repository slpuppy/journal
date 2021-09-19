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
    var mood: Double
    var date: Date
    var afterMood: ResultMood
    var dailyTexts = [DailyTexts]()
    var feelings = [Feeling]()
    var day: String
    var month: String
    var year: String
    var dateString: String

    class DailyTexts: Codable, Identifiable {
        var ID = UUID()
        var question: Question
        var text: String
        
        init(question: Question, awnser: String) {
            self.question = question
            self.text = awnser
        }
    }
    
    init(initialMood: Double) {
        mood = initialMood
        date = Date()
        afterMood = .indefinido
        
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd"
        day = dayFormatter.string(from: self.date)

        let monthFormatter = DateFormatter()
        
        monthFormatter.locale = Locale(identifier: "pt-BR")
        
        monthFormatter.setLocalizedDateFormatFromTemplate("MMMM")
        month = monthFormatter.string(from: self.date).capitalized

        let yearFormatter = DateFormatter()
        yearFormatter.dateFormat = "YYYY"
        year = yearFormatter.string(from: self.date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        dateString = dateFormatter.string(from: self.date)
        

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
    
    public func setDate(day: String, month: String, year: String) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        
        let stringDate = day + "-" + month + "-" + year
        
        self.date = formatter.date(from: stringDate)!
        
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd"
        self.day = dayFormatter.string(from: self.date)

        let monthFormatter = DateFormatter()
        monthFormatter.locale = Locale(identifier: "pt-BR")
        monthFormatter.dateFormat = "MMMM"
        self.month = monthFormatter.string(from: self.date).capitalized

        let yearFormatter = DateFormatter()
        yearFormatter.dateFormat = "YYYY"
        self.year = yearFormatter.string(from: self.date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        dateString = dateFormatter.string(from: self.date)

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
    var tag: String
    let text: String
    let type: FeelingType
    var isExpanded: Bool
    var isSelected: Bool
    
    init(tag: String, text: String, type: FeelingType, isExpanded: Bool) {
        self.tag = tag
        self.type = type
        self.text = text
        self.isExpanded = isExpanded
        self.isSelected = false
    }
    
    static var shared = [
        Feeling(tag: "Amor",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .alegria,
                isExpanded: false),
       
        Feeling(tag: "Otimismo",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .alegria,
                isExpanded: false),
       
        Feeling(tag: "Êxtase",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .alegria,
                isExpanded: false),
        
        Feeling(tag: "Alegria",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .alegria,
                isExpanded: false),
       
        Feeling(tag: "Serenidade",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .alegria,
                isExpanded: false),
        
        Feeling(tag: "Luto",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .tristeza,
                isExpanded: false),
        
        Feeling(tag: "Tristeza",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .tristeza,
                isExpanded: false),
       
        Feeling(tag: "Melancolia",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .tristeza,
                isExpanded: false),
        
        Feeling(tag: "Decepção",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .tristeza,
                isExpanded: false),
        
        Feeling(tag: "Interesse",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .antecipacao,
                isExpanded: false),
        
        Feeling(tag: "Ansiedade",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .antecipacao,
                isExpanded: false),
        
        Feeling(tag: "Encanto",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .surpresa,
                isExpanded: false),
        
        Feeling(tag: "Surpresa",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .surpresa,
                isExpanded: false),
        
        Feeling(tag: "Distração",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .surpresa,
                isExpanded: false),
        
        Feeling(tag: "Repugnância",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .nojo,
                isExpanded: false),
        
        Feeling(tag: "Nojo",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .nojo,
                isExpanded: false),
        
        Feeling(tag: "Tédio",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .nojo,
                isExpanded: false),
        Feeling(tag: "Admiração",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .confianca,
                isExpanded: false),
        
        Feeling(tag: "Confiança",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .confianca,
                isExpanded: false),
        
        Feeling(tag: "Aceitação",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .confianca,
                isExpanded: false),
       
        Feeling(tag: "Ira",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .raiva,
                isExpanded: false),
        
        Feeling(tag: "Raiva",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .raiva,
                isExpanded: false),
        
        Feeling(tag: "Aborrecimento",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .raiva,
                isExpanded: false),
        
        Feeling(tag: "Terror",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .medo,
                isExpanded: false),
       
        Feeling(tag: "Medo",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .medo,
                isExpanded: false),
       
        Feeling(tag: "Apreensão",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .medo,
                isExpanded: false),
        
        Feeling(tag: "Temor",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .medo,
                isExpanded: false),
        
        Feeling(tag: "Culpa",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "Orgulho",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "Desespero",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "Inveja",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "Pessimismo",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "Apatia",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .outros,
                isExpanded: false)
    ]
}

enum FeelingType: String, Codable, CustomStringConvertible {
    case alegria 
    case tristeza
    case antecipacao
    case surpresa
    case nojo
    case confianca
    case raiva
    case medo
    case outros
    var description: String{
        switch self {
        case .alegria : return "ALEGRIA"
        case .tristeza : return "TRISTEZA"
        case .antecipacao : return "ANTECIPAÇÃO"
        case .surpresa : return "SURPRESA"
        case .nojo : return "NOJO"
        case .confianca : return "CONFIANÇA"
        case .raiva : return "RAIVA"
        case .medo : return "MEDO"
        case .outros : return "OUTROS"
        }
    }
    
}
