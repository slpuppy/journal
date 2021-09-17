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
    
    class DailyTexts: Codable, Identifiable {
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

class Feeling:  Codable, Identifiable, ObservableObject {

    enum CodingKeys: CodingKey {
        
        case text
        case isExpanded
        case tag
        case type
        
        
    }
    
    var ID = UUID()
    let tag: String
    @Published var text: String
    let type: FeelingType
    @Published var isExpanded: Bool
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decode(String.self, forKey: .text)
       isExpanded = try container.decode(Bool.self, forKey: .isExpanded)
       tag = try container.decode(String.self, forKey: .tag)
        type = try container.decode(FeelingType.self, forKey: .type)
        
}
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(text, forKey: .text)
        try container.encode(isExpanded, forKey: .isExpanded)
        try container.encode(tag, forKey: .tag)
        try container.encode(type, forKey: .type)
    }
    
   
    
 init(tag: String, text: String, type: FeelingType, isExpanded: Bool) {
        self.tag = tag
        self.type = type
        self.text = text
        self.isExpanded = isExpanded
    }
    
    
    
    
    
    static var shared = [
        Feeling(tag: "amoros@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .alegria,
                isExpanded: false),
       
        Feeling(tag: "otimista",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .alegria,
                isExpanded: false),
       
        Feeling(tag: "extasiad@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .alegria,
                isExpanded: false),
        
        Feeling(tag: "alegre",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .alegria,
                isExpanded: false),
       
        Feeling(tag: "seren@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .alegria,
                isExpanded: false),
        
        Feeling(tag: "luto",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .tristeza,
                isExpanded: false),
        
        Feeling(tag: "triste",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .tristeza,
                isExpanded: false),
       
        Feeling(tag: "melancolic@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .tristeza,
                isExpanded: false),
        
        Feeling(tag: "descepcionad@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .tristeza,
                isExpanded: false),
        
        Feeling(tag: "interessad@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .antecipacao,
                isExpanded: false),
        
        Feeling(tag: "ansios@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .antecipacao,
                isExpanded: false),
        
        Feeling(tag: "vigilante",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .antecipacao,
                isExpanded: false),
        
        Feeling(tag: "maravilhad@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .surpresa,
                isExpanded: false),
        
        Feeling(tag: "surpres@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .surpresa,
                isExpanded: false),
        
        Feeling(tag: "distraid@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .surpresa,
                isExpanded: false),
        
        Feeling(tag: "repugnancia",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .nojo,
                isExpanded: false),
        
        Feeling(tag: "enojad@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .nojo,
                isExpanded: false),
        
        Feeling(tag: "entediad@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .nojo,
                isExpanded: false),
        Feeling(tag: "adminirad@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .confianca,
                isExpanded: false),
        
        Feeling(tag: "confiante",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .confianca,
                isExpanded: false),
        
        Feeling(tag: "aceit@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .confianca,
                isExpanded: false),
       
        Feeling(tag: "irad@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .raiva,
                isExpanded: false),
        
        Feeling(tag: "irritad@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .raiva,
                isExpanded: false),
        
        Feeling(tag: "aborrecid@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .raiva,
                isExpanded: false),
        
        Feeling(tag: "aterrorizad@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .medo,
                isExpanded: false),
       
        Feeling(tag: "medo",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .medo,
                isExpanded: false),
       
        Feeling(tag: "apreenciv@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .medo,
                isExpanded: false),
        
        Feeling(tag: "intimidad@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .medo,
                isExpanded: false),
        
        Feeling(tag: "culpad@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "orgulhos@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "desesperad@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "inveja",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "pessimista",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "apatic@",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .outros,
                isExpanded: false)
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
