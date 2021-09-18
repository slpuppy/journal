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
        
        
        ACarousel(FeelingType.allCases, id: \.self, headspace: 5, isWrap: false ){ feeling in
            
            VStack{
                Text(feeling.rawValue).font(.system(size: 24, weight: .bold, design: .default))
                    .foregroundColor(Color("Roxão dark"))
                
                
                ScrollView{
                    
                    VStack{
                        HStack{
                            ZStack{
                                Image(systemName: "chevron.left")
                                    .padding()
                                    .opacity(0.0)
                                
                                if feeling != .alegria {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(Color("Roxão dark"))
                                        .padding()
                                }
                            }.padding()
                            Spacer()
                            Image(feeling.rawValue).resizable().scaledToFit()
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                                .padding(.bottom, 20)
                            Spacer()
                            ZStack{
                                
                                Image(systemName: "chevron.right")
                                    .padding()
                                    .opacity(0.0)
                                
                                if feeling != .outros {
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color("Roxão dark"))
                                        .padding()
                                }
                            }.padding()
                        }
                    
                    }
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
