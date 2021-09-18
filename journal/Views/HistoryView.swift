//
//  HistoryView.swift
//  journal
//
//  Created by Alessandra Fernandes Lacerda on 15/09/21.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var controller: JournalController
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "AzulEscuro")]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "AzulEscuro")]

    }
    
    var journal1 = Journal(initialMood: 2)
    var journal2 = Journal(initialMood: 5)
    var journal3 = Journal(initialMood: 1)
    
    var currentYear: String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY"
        
        return formatter.string(from: date)
    }
    
    var years : [String] {
        var array: [String] = []
        
        for journal in controller.journal.sorted(by: { $0.date.timeIntervalSince1970 < $1.date.timeIntervalSince1970}){
            if !array.contains(journal.year) {
                array.append(journal.year)
            }
        }
        return array
    }
    
    var months: [String: [String]] {
        var array = [String: [String]]()
        
        for year in years{
            array[year] = []
        }
        
        for year in years {
            
            for journal in controller.journal.sorted(by: { $0.date.timeIntervalSince1970 < $1.date.timeIntervalSince1970}).filter({ $0.year == year}){
                
                if !array[year]!.contains(journal.month){
                    array[year]!.append(journal.month)
                }
            }
        }
        
        return array
    }
    
    var body: some View {
        NavigationView{
            
            ScrollView{
                
                LazyVStack(alignment: .leading){
                    
                    
                    ForEach(years, id: \.self){ year in
                        
                        ForEach(months[year]!, id: \.self){ month in
                            
                            HStack{
                                Text(month).font(.system(size: 20, weight:.semibold)).foregroundColor(Color("AzulEscuro"))
                                if year != currentYear {
                                    Text(year).font(.system(size: 20, weight:.semibold)).foregroundColor(Color("AzulEscuro"))
                                }
                                Spacer()
                            }.padding(.top)
                            .padding(.leading)
                            .padding(.trailing)
                            
                            ForEach(controller.journal.sorted(by: { $0.date.timeIntervalSince1970 < $1.date.timeIntervalSince1970}).filter { $0.year == year && $0.month == month}) { journal in
                                NavigationLink(destination: DetailedEntryView(journal: journal, currentYear: currentYear)){
                                    EntryCard(journal: journal)
                                }
                            }
                        }
                    }
                }.padding()
            }.navigationBarTitle("Histórico")
            .background(Color("BackgroundColor").ignoresSafeArea())
        }.accentColor(Color("AzulEscuro"))
        
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
