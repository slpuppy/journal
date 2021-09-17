//
//  FeelingsCollectionView.swift
//  journal
//
//  Created by Alessandra Fernandes Lacerda on 17/09/21.
//

import SwiftUI
import ACarousel

struct FeelingsCollectionView: View {
    
    var body: some View {
        ACarousel(FeelingType.allCases, id: \.self, isWrap: false){ feeling in
            
            VStack{
                HStack{
                    if feeling != .alegria {
                        Image(systemName: "chevron.left")
                    }
                    
                    Spacer()
                    
                    Text(feeling.rawValue)
                    
                    Spacer()
                    
                    if feeling != .outros {
                        Image(systemName: "chevron.right")
                    }
                }.padding()
                
                ScrollView{
                    Image(feeling.rawValue).resizable().scaledToFit().frame(width: 131)
                    
                    
                    FeelingsCollectionTableView(category: feeling).padding(.bottom)
                    
                    Spacer()
                }
            }

        }
    }
}

struct FeelingsCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        FeelingsCollectionView()
    }
}
