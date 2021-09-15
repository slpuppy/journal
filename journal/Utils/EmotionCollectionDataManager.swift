import SwiftUI
import Combine


class ListDataSource: ObservableObject {
    var willChange = PassthroughSubject<Void, Never>()
    var rowModels = [Feeling](){
        willSet { willChange.send() }
    }
    init() {
        addNewRowModel(withName: "Alegria", detail: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.")
        addNewRowModel(withName: "Amor", detail: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.")
       addNewRowModel(withName: "Otimismo", detail: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.")
        
        addNewRowModel(withName: "Êxtase", detail: "A alegria é um sentimento de plenitude e satisfação interior. Ela pode te ajudar a prestar atenção no que está bom na sua vida, e te lembrar do que mais importa pra você.")
    }
    
    private func addNewRowModel(withName name: String, detail: String) {
        let model = Feeling(name: name ,
                                    detail: detail,
                                    isExpanded: false)
        rowModels.append(model)
    }
  }
