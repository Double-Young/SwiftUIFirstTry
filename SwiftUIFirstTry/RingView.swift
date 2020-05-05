//
//  RingView.swift
//  SwiftUIFirstTry
//
//  Created by Young on 2020/5/5.
//  Copyright © 2020 DoubleYoung. All rights reserved.
//

import SwiftUI

struct RingView: View {
    var color1 = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
    var color2 = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var width: CGFloat = 88
    var height: CGFloat = 88
    var percent: CGFloat = 70
    @Binding var show : Bool
    @State var count: Int = 0
    
    func counter(){
        for i in 0...Int(percent)
        {
            count = i
        }
    }
    
    var body: some View {
        let multiplier = width/44
        let progress = 1 - (percent/100)
        return ZStack {

            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 8*multiplier, lineCap: .round, lineJoin: .round))
                .frame(width:width, height: height)
            
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(LinearGradient(gradient:Gradient(colors: [Color(color1),Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading), style: StrokeStyle(lineWidth: 5*multiplier, lineCap: .round, lineJoin: .round))
                .rotationEffect(.degrees(-90))
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .frame(width:width, height: height)
                .shadow(color: Color(color1).opacity(0.3), radius: 5, x: 0, y: 5)

            
            
            Text("\(Int(percent))%")
                           .fontWeight(.bold)
                           .font(.system(size: 14*multiplier))
            
            
            
           
            
        }
        
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}

