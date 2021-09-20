//
//  JournalController.swift
//  journal
//
//  Created by Paulo Tadashi Tokikawa on 14/09/21.
//

import Foundation

class JournalController: ObservableObject {
    @Published var journal = [Journal]()
    @Published var question = [Question]()
    @Published var feelings = [Feeling]()
    
    @Published var currentJournal: Journal?
    @Published var currentMood: Double = 5
    @Published var currentFeelings = [Feeling]()
    @Published var currentTitle = ""
    @Published var currentText = ""
    @Published var currentAfterMood = ResultMood.indefinido
    
    let feelingTypes = [FeelingType.alegria, FeelingType.tristeza, FeelingType.antecipacao, FeelingType.surpresa, FeelingType.nojo, FeelingType.confianca, FeelingType.raiva, FeelingType.medo, FeelingType.outros]
    private var userFeelings = [Feeling]()
    private var defaultFeelings = [Feeling]()
    
    
    init() {
        loadShared()
    }
    
    private func loadShared(){
        getJournal()
        question = Question.shared
        defaultFeelings = Feeling.shared
        getFeeling()
        updateFeeling()
    }
    
    
    func saveJournal(_ toBeSaved: Journal){
        journal.append(toBeSaved)
        saveJournalUserDefault(journal)
    }
    
    func selectFeeling(_ feeling: Feeling) {
        for i in 0..<feelings.count{
            if feelings[i].ID == feeling.ID{
                feelings[i].isSelected.toggle()
                if feelings[i].isSelected {
                    currentFeelings.append(feeling)
                }
                else {
                    for j in 0..<currentFeelings.count {
                        if currentFeelings[j].ID == feelings[i].ID {
                            currentFeelings.remove(at: j)
                        }
                    }
                }
            }
        }
        objectWillChange.send()
    }
    
    func resetCurrent(){
        for feeling in feelings {
            feeling.isSelected = false
        }
        currentJournal = nil
        currentMood = 5
        currentFeelings = [Feeling]()
        currentTitle = ""
        currentText = ""
        currentAfterMood = ResultMood.indefinido
        objectWillChange.send()
    }
    
    private func saveJournalUserDefault(_ value: [Journal]) {
        do {
            let data = try JSONEncoder().encode(value)
            UserDefaults.standard.set(data, forKey: "savedJournal")
        }
        catch {
            print(error)
            fatalError()
        }
    }
    
    private func getJournal() {
        do {
            guard let encoded = UserDefaults.standard.data(forKey: "savedJournal") else { return }
            journal = try JSONDecoder().decode([Journal].self, from: encoded)
        }
        catch {
            print(error)
            fatalError()
        }
    }
    
    func addUserFeeling(tag: String, text: String, type: FeelingType, isExpanded: Bool){
        userFeelings.append(
            Feeling(tag: tag, text: text, type: type, isExpanded: isExpanded)
        )
        saveFeeling(userFeelings)
        updateFeeling()
    }
    
    private func saveFeeling(_ value: [Feeling]) {
        do {
            let data = try JSONEncoder().encode(value)
            UserDefaults.standard.set(data, forKey: "savedFeeling")
        }
        catch {
            print(error)
            fatalError()
        }
    }

    private func getFeeling() {
        do {
            guard let encoded = UserDefaults.standard.data(forKey: "savedFeeling") else { return }
            userFeelings = try JSONDecoder().decode([Feeling].self, from: encoded)
        }
        catch {
            print(error)
            fatalError()
        }
    }
    
    private func updateFeeling(){
        feelings = userFeelings + defaultFeelings
    }
    

}
