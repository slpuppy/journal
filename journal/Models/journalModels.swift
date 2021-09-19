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

class Feeling:  Codable, Identifiable, ObservableObject {
    
    
    
    enum CodingKeys: CodingKey {
      
      case text
      case isExpanded
      case tag
      case type
      case isSelected
      
      
  }

    var ID = UUID()
    var tag: String
    @Published var text: String
    let type: FeelingType
    @Published var isExpanded: Bool
    var isSelected: Bool
    
    
    required init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: CodingKeys.self)
          text = try container.decode(String.self, forKey: .text)
          isExpanded = try container.decode(Bool.self, forKey: .isExpanded)
          tag = try container.decode(String.self, forKey: .tag)
          type = try container.decode(FeelingType.self, forKey: .type)
          isSelected = try container.decode(Bool.self, forKey: .isSelected)
           
   }
    
    
    func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(text, forKey: .text)
            try container.encode(isExpanded, forKey: .isExpanded)
            try container.encode(tag, forKey: .tag)
            try container.encode(type, forKey: .type)
            try container.encode(isSelected, forKey: .isSelected)
        }
    
    
    
    init(tag: String, text: String, type: FeelingType, isExpanded: Bool) {
        self.tag = tag
        self.type = type
        self.text = text
        self.isExpanded = isExpanded
        self.isSelected = false
    }
    
    static var shared = [
        Feeling(tag: "Amor",
                text: "O amor é um sentimento em relação a alguém ou alguma coisa e nasce o desejo que que aquela pessoa ou coisa tenha todo o bem que possa ter, saca o melhor de nós mesmos.",
                type: .alegria,
                isExpanded: false),
       
        Feeling(tag: "Otimismo",
                text: "Otimismo é a disposição para encarar as coisas pelo seu lado positivo e esperar sempre por um desfecho favorável, mesmo em situações muito difíceis.",
                type: .alegria,
                isExpanded: false),
       
        Feeling(tag: "Êxtase",
                text: "Êxtase é o estado emocional em que o indivíduo se sente fora de si ou em transe, caracterizado pela intensificação extrema de variados sentimentos, como o prazer, a alegria, o medo, etc.",
                type: .alegria,
                isExpanded: false),
        
        Feeling(tag: "Alegria",
                text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.",
                type: .alegria,
                isExpanded: false),
       
        Feeling(tag: "Serenidade",
                text: "Característica da pessoa que age com tranquilidade diante de situações complicadas, perigosas, traumáticas: enfrentou as adversidades com serenidade.",
                type: .alegria,
                isExpanded: false),
        
        Feeling(tag: "Luto",
                text: "Chamamos de luto a um estado emocional específico, que se inicia pela ameaça ou rompimento de um vínculo de amor e se caracteriza como um período de enfrentamento da dor da perda.",
                type: .tristeza,
                isExpanded: false),
        
        Feeling(tag: "Tristeza",
                text: "Estar triste é caracterizado por ter baixa autoestima, sentimentos de solidão, culpa, cansaço, angústia ou dor.",
                type: .tristeza,
                isExpanded: false),
       
        Feeling(tag: "Melancolia",
                text: "é uma tristeza vaga, permanente e profunda, que leva o sujeito a sentir-se triste e a não desfrutar dos prazeres da vida. ",
                type: .tristeza,
                isExpanded: false),
        
        Feeling(tag: "Decepção",
                text: "Sentimento de tristeza, descontentamento ou frustração pela ocorrência de fato inesperado, que representa um mal; desilusão, desapontamento.",
                type: .tristeza,
                isExpanded: false),
        
        Feeling(tag: "Interesse",
                text: "Sentir atraído por algo, relacionado a outros sentimentos bons",
                type: .antecipacao,
                isExpanded: false),
        
        Feeling(tag: "Ansiedade",
                text: "Preocupação intensa, excessiva e persistente e medo de situações cotidianas. ",
                type: .antecipacao,
                isExpanded: false),
        
        Feeling(tag: "Encanto",
                text: "É uma reação do ser humano, criada em função de um estímulo externo qualquer, que provoca a sensação de interesse profundo",
                type: .surpresa,
                isExpanded: false),
        
        Feeling(tag: "Surpresa",
                text: "A surpresa é um sentimento de reação. Surge a partir de um acontecimento, um fato, alguma coisa inesperada e repentina. Pode ser positiva ou negativa, causar admiração ou espanto: a chegada ou a morte de alguém, um prêmio recebido, uma comemoração, uma notícia importante",
                type: .surpresa,
                isExpanded: false),
        
        Feeling(tag: "Distração",
                text: "Falta de atenção em relação ao mundo exterior; desatenção.",
                type: .surpresa,
                isExpanded: false),
        
        Feeling(tag: "Repugnância",
                text: "Espécie de aversão por alguém ou por alguma coisa; relutância; escrúpulo; asco; nojo; incompatibilidade.",
                type: .nojo,
                isExpanded: false),
        
        Feeling(tag: "Repulsão",
                text: "Sentimento que denota repulsa; sensação de asco ou aversão. Falta de compatibilidade; antipatia.",
                type: .nojo,
                isExpanded: false),
        
        Feeling(tag: "Tédio",
                text: "O tédio é um sentimento humano descrito como um estado de falta de estímulo, ou do presenciamento de uma ação ou estado repetitivo",
                type: .nojo,
                isExpanded: false),
        Feeling(tag: "Admiração",
                text: "Tendência emocional para demonstrar respeito, estima, consideração ou simpatia por (algo ou alguém)",
                type: .confianca,
                isExpanded: false),
        
        Feeling(tag: "Confiança",
                text: "A confiança, então, seria a hipótese que formulamos sobre o comportamento futuro de algo ou alguém, e que não depende de nós.",
                type: .confianca,
                isExpanded: false),
        
        Feeling(tag: "Aceitação",
                text: "A aceitação é quando você aceita que é como é, que as coisas são como são, mas você desenvolve um pensamento estratégico, conseguindo lidar com diversas situações em sua vida de forma a evoluir.",
                type: .confianca,
                isExpanded: false),
       
        Feeling(tag: "Ira",
                text: "Intenso sentimento de ódio",
                type: .raiva,
                isExpanded: false),
        
        Feeling(tag: "Raiva",
                text: "De um modo geral, a raiva define-se como um sentimento de protesto, insegurança, timidez ou frustração, contra alguém ou alguma coisa, que se exterioriza quando o ego se sente ferido ou ameaçado. ",
                type: .raiva,
                isExpanded: false),
        
        Feeling(tag: "Aborrecimento",
                text: " Estado ou sensação vaga de desprazer e até de certa repugnância.",
                type: .raiva,
                isExpanded: false),
        
        Feeling(tag: "Terror",
                text: "Algo completamente aterrorizante que mistura medo e impotencia perante ao que causa medo",
                type: .medo,
                isExpanded: false),
       
        Feeling(tag: "Medo",
                text: "Medo é um estado emocional que surge em resposta a consciência perante uma situação de eventual perigo. A ideia de que algo ou alguma coisa possa ameaçar a segurança ou a vida de alguém, faz com que o cérebro ative, involuntariamente, uma série de compostos químicos que provocam reações que caracterizam o medo.",
                type: .medo,
                isExpanded: false),
       
        Feeling(tag: "Apreensão",
                text: "Incerteza ou desconforto diante de algo desconhecido, estranho ou de uma situação que pode constituir uma ameaça.",
                type: .medo,
                isExpanded: false),
        
        Feeling(tag: "Culpa",
                text: "O sentimento de culpa surge quando alguém se arrepende por alguma atitude que tomou ou quando não aceita os seus defeitos, erros, fraquezas e até mesmo a sua insignificância na condição de ser humano.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "Orgulho",
                text: "Sentimento de prazer, de grande satisfação com o próprio valor, com a própria honra.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "Desespero",
                text: "Sentimento de extrema aflição quando não vemos uma saída para uma determinada situação que nos incomoda de alguma forma.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "Inveja",
                text: "É um sentimento de inferioridade e de desgosto diante da felicidade do outro. É um sentimento de cobiça da riqueza, do brilho e da prosperidade alheia.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "Pessimismo",
                text: "Tendência para ver e julgar as coisas pelo lado mais desfavorável; disposição de quem sempre espera pelo pior.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "Apatia",
                text: "Sentir-se indiferente ou sem emoção.",
                type: .outros,
                isExpanded: false)
    ]
}

enum FeelingType: String, Codable, CustomStringConvertible, CaseIterable {
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
        case .alegria : return "Alegria"
        case .tristeza : return "Tristeza"
        case .antecipacao : return "Antecipação"
        case .surpresa : return "Surpresa"
        case .nojo : return "Repulsão"
        case .confianca : return "Confiança"
        case .raiva : return "Raiva"
        case .medo : return "Medo"
        case .outros : return "Outros"
        }
    }
    
}
