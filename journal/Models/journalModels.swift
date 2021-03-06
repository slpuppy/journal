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
        var title: String
        var text: String
        
        init(question: Question, title: String, awnser: String) {
            self.question = question
            self.title = title
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
    
    public func addText(question: Question, title: String, awnser: String){
        let text = DailyTexts(question: question, title: title, awnser: awnser)
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
        Question(text: "O que te fez sentir essas emo????es?", type: .meio),
        Question(text: "O que voc?? faria para melhorar?", type: .fim)
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
                text: "O amor ?? um sentimento em rela????o a algu??m ou alguma coisa e nasce o desejo que que aquela pessoa ou coisa tenha todo o bem que possa ter, saca o melhor de n??s mesmos.",
                type: .alegria,
                isExpanded: false),
       
        Feeling(tag: "Otimismo",
                text: "Otimismo ?? a disposi????o para encarar as coisas pelo seu lado positivo e esperar sempre por um desfecho favor??vel, mesmo em situa????es muito dif??ceis.",
                type: .alegria,
                isExpanded: false),
       
        Feeling(tag: "??xtase",
                text: "??xtase ?? o estado emocional em que o indiv??duo se sente fora de si ou em transe, caracterizado pela intensifica????o extrema de variados sentimentos, como o prazer, a alegria, o medo, etc.",
                type: .alegria,
                isExpanded: false),
        
        Feeling(tag: "Alegria",
                text: "A alegria ?? um sentimento de plenitude e satisfa????o interior. Ela pode te ajudar a prestar aten????o no que est?? bom na sua vida, e te lembrar do que mais importa pra voc??.",
                type: .alegria,
                isExpanded: false),
       
        Feeling(tag: "Serenidade",
                text: "Caracter??stica da pessoa que age com tranquilidade diante de situa????es complicadas, perigosas, traum??ticas: enfrentou as adversidades com serenidade.",
                type: .alegria,
                isExpanded: false),
        
        Feeling(tag: "Luto",
                text: "Chamamos de luto a um estado emocional espec??fico, que se inicia pela amea??a ou rompimento de um v??nculo de amor e se caracteriza como um per??odo de enfrentamento da dor da perda.",
                type: .tristeza,
                isExpanded: false),
        
        Feeling(tag: "Tristeza",
                text: "Estar triste ?? caracterizado por ter baixa autoestima, sentimentos de solid??o, culpa, cansa??o, ang??stia ou dor.",
                type: .tristeza,
                isExpanded: false),
       
        Feeling(tag: "Melancolia",
                text: "?? uma tristeza vaga, permanente e profunda, que leva o sujeito a sentir-se triste e a n??o desfrutar dos prazeres da vida. ",
                type: .tristeza,
                isExpanded: false),
        
        Feeling(tag: "Decep????o",
                text: "Sentimento de tristeza, descontentamento ou frustra????o pela ocorr??ncia de fato inesperado, que representa um mal; desilus??o, desapontamento.",
                type: .tristeza,
                isExpanded: false),
        
        Feeling(tag: "Interesse",
                text: "Sentir atra??do por algo, relacionado a outros sentimentos bons",
                type: .antecipacao,
                isExpanded: false),
        
        Feeling(tag: "Ansiedade",
                text: "Preocupa????o intensa, excessiva e persistente e medo de situa????es cotidianas. ",
                type: .antecipacao,
                isExpanded: false),
        
        Feeling(tag: "Encanto",
                text: "?? uma rea????o do ser humano, criada em fun????o de um est??mulo externo qualquer, que provoca a sensa????o de interesse profundo",
                type: .surpresa,
                isExpanded: false),
        
        Feeling(tag: "Surpresa",
                text: "A surpresa ?? um sentimento de rea????o. Surge a partir de um acontecimento, um fato, alguma coisa inesperada e repentina. Pode ser positiva ou negativa, causar admira????o ou espanto: a chegada ou a morte de algu??m, um pr??mio recebido, uma comemora????o, uma not??cia importante",
                type: .surpresa,
                isExpanded: false),
        
        Feeling(tag: "Distra????o",
                text: "Falta de aten????o em rela????o ao mundo exterior; desaten????o.",
                type: .surpresa,
                isExpanded: false),
        
        Feeling(tag: "Repugn??ncia",
                text: "Esp??cie de avers??o por algu??m ou por alguma coisa; relut??ncia; escr??pulo; asco; nojo; incompatibilidade.",
                type: .nojo,
                isExpanded: false),
        
        Feeling(tag: "Repuls??o",
                text: "Sentimento que denota repulsa; sensa????o de asco ou avers??o. Falta de compatibilidade; antipatia.",
                type: .nojo,
                isExpanded: false),
        
        Feeling(tag: "T??dio",
                text: "O t??dio ?? um sentimento humano descrito como um estado de falta de est??mulo, ou do presenciamento de uma a????o ou estado repetitivo",
                type: .nojo,
                isExpanded: false),
        Feeling(tag: "Admira????o",
                text: "Tend??ncia emocional para demonstrar respeito, estima, considera????o ou simpatia por (algo ou algu??m)",
                type: .confianca,
                isExpanded: false),
        
        Feeling(tag: "Confian??a",
                text: "A confian??a, ent??o, seria a hip??tese que formulamos sobre o comportamento futuro de algo ou algu??m, e que n??o depende de n??s.",
                type: .confianca,
                isExpanded: false),
        
        Feeling(tag: "Aceita????o",
                text: "A aceita????o ?? quando voc?? aceita que ?? como ??, que as coisas s??o como s??o, mas voc?? desenvolve um pensamento estrat??gico, conseguindo lidar com diversas situa????es em sua vida de forma a evoluir.",
                type: .confianca,
                isExpanded: false),
       
        Feeling(tag: "Ira",
                text: "Intenso sentimento de ??dio",
                type: .raiva,
                isExpanded: false),
        
        Feeling(tag: "Raiva",
                text: "De um modo geral, a raiva define-se como um sentimento de protesto, inseguran??a, timidez ou frustra????o, contra algu??m ou alguma coisa, que se exterioriza quando o ego se sente ferido ou amea??ado. ",
                type: .raiva,
                isExpanded: false),
        
        Feeling(tag: "Aborrecimento",
                text: " Estado ou sensa????o vaga de desprazer e at?? de certa repugn??ncia.",
                type: .raiva,
                isExpanded: false),
        
        Feeling(tag: "Terror",
                text: "Algo completamente aterrorizante que mistura medo e impotencia perante ao que causa medo",
                type: .medo,
                isExpanded: false),
       
        Feeling(tag: "Medo",
                text: "Medo ?? um estado emocional que surge em resposta a consci??ncia perante uma situa????o de eventual perigo. A ideia de que algo ou alguma coisa possa amea??ar a seguran??a ou a vida de algu??m, faz com que o c??rebro ative, involuntariamente, uma s??rie de compostos qu??micos que provocam rea????es que caracterizam o medo.",
                type: .medo,
                isExpanded: false),
       
        Feeling(tag: "Apreens??o",
                text: "Incerteza ou desconforto diante de algo desconhecido, estranho ou de uma situa????o que pode constituir uma amea??a.",
                type: .medo,
                isExpanded: false),
        
        Feeling(tag: "Culpa",
                text: "O sentimento de culpa surge quando algu??m se arrepende por alguma atitude que tomou ou quando n??o aceita os seus defeitos, erros, fraquezas e at?? mesmo a sua insignific??ncia na condi????o de ser humano.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "Orgulho",
                text: "Sentimento de prazer, de grande satisfa????o com o pr??prio valor, com a pr??pria honra.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "Desespero",
                text: "Sentimento de extrema afli????o quando n??o vemos uma sa??da para uma determinada situa????o que nos incomoda de alguma forma.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "Inveja",
                text: "?? um sentimento de inferioridade e de desgosto diante da felicidade do outro. ?? um sentimento de cobi??a da riqueza, do brilho e da prosperidade alheia.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "Pessimismo",
                text: "Tend??ncia para ver e julgar as coisas pelo lado mais desfavor??vel; disposi????o de quem sempre espera pelo pior.",
                type: .outros,
                isExpanded: false),
        
        Feeling(tag: "Apatia",
                text: "Sentir-se indiferente ou sem emo????o.",
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
        case .antecipacao : return "Antecipa????o"
        case .surpresa : return "Surpresa"
        case .nojo : return "Repuls??o"
        case .confianca : return "Confian??a"
        case .raiva : return "Raiva"
        case .medo : return "Medo"
        case .outros : return "Outros"
        }
    }
    
}
