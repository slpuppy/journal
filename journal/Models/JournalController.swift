//
//  JournalController.swift
//  journal
//
//  Created by Paulo Tadashi Tokikawa on 14/09/21.
//

import Foundation

class JournalController: ObservableObject {
    var journal = [Journal]()
    var question = [Question]()
    
    var userFeelings = [Feeling]()
    var defaultFeelings = [Feeling]()
    
    init() {
        loadShared()
    }
    
    private func loadShared(){
        getJournal()
        question = Question.shared
        defaultFeelings = Feeling.shared
        getFeeling()
    }
    
    
    func saveJournal(_ toBeSaved: Journal){
        journal.append(toBeSaved)
        saveJournalUserDefault(journal)
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
    
    func addUserFeeling(tag: String, type: FeelingType){
        userFeelings.append(
            Feeling(tag: tag, type: type)
        )
        saveFeeling(userFeelings)
    }
    
    func addFeeling(tag: String, type: FeelingType){
        userFeelings.append(
            Feeling(tag: tag, type: type)
        )
    }
    
    func saveFeeling(_ value: [Feeling]) {
        do {
            let data = try JSONEncoder().encode(value)
            UserDefaults.standard.set(data, forKey: "savedFeeling")
        }
        catch {
            print(error)
            fatalError()
        }
    }

    func getFeeling() {
        do {
            guard let encoded = UserDefaults.standard.data(forKey: "savedFeeling") else { return }
            userFeelings = try JSONDecoder().decode([Feeling].self, from: encoded)
        }
        catch {
            print(error)
            fatalError()
        }
    }
    

}
