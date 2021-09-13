//
//  ContentView.swift
//  journal
//
//  Created by Gabriel Puppi on 31/08/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    
    @FetchRequest(sortDescriptors: [])
    
    private var viewEntrys : FetchedResults<Entrys>
    let formatter = DateFormatter()
    
    var body: some View {
        
        NavigationView {
            List{
                ForEach(viewEntrys) { viewEntry in
                    VStack {
                        HStack {
                            Text("Potato")
                            if let date = viewEntry.date{
                                Text("\(date)")
                            }
                            Text("\(viewEntry.mood)")
                            Text("\(viewEntry.afterMood)")
                        }
                        
                    }
                    ForEach(viewEntry.textArray) { text in
                        Text(text.text ?? "empty")
                    }
                }.onDelete(perform: deleteTasks)
            }
            .navigationTitle("title")
            .navigationBarItems(trailing: Button("Add Entry"){
                addEntry()
            })
        }
    }
    
    private func saveContext(){
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error: \(error)")
        }
    }
    
    private func deleteTasks(offsets: IndexSet){
        withAnimation{
            offsets.map { viewEntrys[$0]}.forEach(viewContext.delete)
            saveContext()
        }
    }
    
    private func addEntry(){
        withAnimation{
            let newEntry = Entrys(context: viewContext)
            newEntry.date = Date()
            newEntry.afterMood = Int16.random(in: 0...10)
            newEntry.mood = Int16.random(in: 0...10)
            for i in 1...Int.random(in: 2...5){
                let newText = EntrysTexts(context: viewContext)
                newText.text = "\(Int.random(in: 1...9999))"
                newText.order = Int16(i)
                newEntry.addToTexts(newText)
            }
            saveContext()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
