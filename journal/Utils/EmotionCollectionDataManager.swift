import SwiftUI
import Combine


class ListDataSource: ObservableObject {
    var willChange = PassthroughSubject<Void, Never>()
    var rowModels = [Feeling](){
        willSet { willChange.send() }
    }
    init() {
        addNewRowModel(withName: "Alegria", text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.", type: .alegria)
        addNewRowModel(withName: "Amor", text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.", type: .alegria)
        addNewRowModel(withName: "Otimismo", text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.", type: .alegria)
        addNewRowModel(withName: "Êxtase", text: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.", type: .alegria)
    }
    
    private func addNewRowModel(withName tag: String, text: String, type: FeelingType) {
        let model = Feeling(tag: tag, text: text, type: type, isExpanded: false)
        rowModels.append(model)
    }
  }
