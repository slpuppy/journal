//
//  MoodTrackerView.swift
//  journal
//
//  Created by Alessandra Fernandes Lacerda on 01/09/21.
//

import SwiftUI
import Liquid

struct Line: Shape {
    var start, end, control: CGPoint

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: start)
            path.addQuadCurve(to: end, control: control)
        }
    }
}


struct MoodTrackerView: View {
    @State var sliderValue: Double = 5
    
    var body: some View {
        VStack{
            
            Spacer()
            ZStack{
                
                GeometryReader{ geometry in
                    
                    Liquid(samples: 6, period: 1.5)
                                    .frame(width: 200, height: 200)
                                    .position(x: geometry.size.width / 2 + CGFloat(sliderValue)/10 * 30, y: geometry.size.height / 2 - CGFloat(sliderValue)/10 * 30)
                                    .foregroundColor(Color(UIColor(red: (CGFloat(sliderValue) >= 5) ?
                                                                        ((CGFloat((sliderValue - 5)/5) * 127) + 128)/255 :
                                                                        ((CGFloat((sliderValue)/5) * 43) + 85)/255,
                                                                   green: (CGFloat(sliderValue) >= 5) ?
                                                                        128/255 :
                                                                        ((CGFloat((sliderValue)/5) * 43) + 85)/255,
                                                                   blue: (CGFloat(sliderValue) >= 5) ?
                                                                        128/255 :
                                                                        ((CGFloat((sliderValue)/5) * (-72)) + 200)/255,
                                                                   alpha: 0.9)))
                        .blendMode(.multiply)
                    
                    Liquid(samples: 6, period: 2)
                        .frame(width: 200, height: 200)
                        .position(x: geometry.size.width / 2 - CGFloat(sliderValue)/10 * 30 , y: geometry.size.height / 2 - CGFloat(sliderValue)/10 * 30)
                        .foregroundColor(Color(UIColor(red: (CGFloat(sliderValue) >= 5) ?
                                                        ((CGFloat((sliderValue - 5)/5) * 75) + 180)/255 :
                                                        ((CGFloat((sliderValue)/5) * (180)))/255,
                                                   green: (CGFloat(sliderValue) >= 5) ?
                                                        180/255 :
                                                        ((CGFloat((sliderValue)/5) * (100)) + 80)/255,
                                                   blue: (CGFloat(sliderValue) >= 5) ?
                                                        ((CGFloat((sliderValue - 5)/5) * (-40)) + 180)/255 :
                                                        ((CGFloat((sliderValue)/5) * (-20)) + 200)/255,
                                                   alpha: 0.9)))
                                    .blendMode(.multiply)
        
                    Liquid(samples: 6, period: 2)
                        .frame(width: 200, height: 200)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2 + CGFloat(sliderValue)/10 * 30 )
                        .foregroundColor(Color(UIColor(red: (CGFloat(sliderValue) >= 5) ?
                                                        ((CGFloat((sliderValue - 5)/5) * 55) + 200)/255 :
                                                        ((CGFloat((sliderValue)/5) * (200)))/255,
                                                       green: (CGFloat(sliderValue) >= 5) ?
                                                        200/255 :
                                                        ((CGFloat((sliderValue)/5) * (80)) + 120)/255,
                                                       blue: (CGFloat(sliderValue) >= 5) ?
                                                        ((CGFloat((sliderValue - 5)/5) * (-72)) + 200)/255 :
                                                        200/255,
                                                       alpha: 0.9)))
                                    .blendMode(.multiply)
                    
                    Line(start: CGPoint(x: geometry.size.width / 2 - 40, y: geometry.size.height / 2 ),
                         end: CGPoint(x: geometry.size.width / 2 + 40 , y: geometry.size.height / 2 ),
                         control: CGPoint(x: geometry.size.width / 2 ,y: geometry.size.height / 2 + CGFloat(sliderValue)*4 - 20))
                        .stroke(style:StrokeStyle(lineWidth: 6.0, lineCap: .round))
                        .foregroundColor(.white)
                    
                }

            }.frame(width: 400, height: 400)
            
            Slider(value: $sliderValue, in: 0...10).accentColor(.gray).padding(30)
            
            CheckButton(buttonColor: Color("AzulEscuro"),
                        checkColor: Color("Bege")).frame(width: 70, height: 70)
            
            Spacer()
        }.background(Color("BackgroundColor").ignoresSafeArea())
        
    }
}

struct MoodTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        MoodTrackerView()
    }
}
