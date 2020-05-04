//
//  MenuPage.swift
//  SwiftUIFirstTry
//
//  Created by Young on 2020/5/3.
//  Copyright © 2020 DoubleYoung. All rights reserved.
//

import SwiftUI

struct MenuPage: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing:16) {
                Text("Meng - 28% completed")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(Color(#colorLiteral(red: 0.3450980392, green: 0.3843137255, blue: 0.4431372549, alpha: 1)))
                    
                Color.white
                        .frame(width: 38, height: 6)
                        .cornerRadius(3)
                        .frame(width: 130, height: 6, alignment: .leading)
                        .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08)))
                        .cornerRadius(3)
                        .padding()
                        .frame(width: 150, height: 24)
                        .background(Color(#colorLiteral(red: 0.7882352941, green: 0.8196078431, blue: 0.862745098, alpha: 1)))
                        .cornerRadius(12)
                        .shadow(color: Color.white, radius: 0, x: 0, y: 1)
                    .padding(.bottom, 20)
                
                
                MenuRow(title: "Account", icon: "gear")
                MenuRow(title: "Billing", icon: "creditcard")
                MenuRow(title: "Sign out", icon: "person.crop.circle")
            }
                .frame( maxWidth: .infinity)
                .frame(height :300)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.8705882353, green: 0.8941176471, blue: 0.9450980392, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                .clipShape(RoundedRectangle(cornerRadius: 30,style: .continuous))
                .shadow(color: Color.black.opacity(0.15), radius: 40, x: 0, y: 40)
                .padding(.horizontal,30)
                .overlay(Image("Avatar")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .shadow(color: Color(#colorLiteral(red: 0.6117647059, green: 0.6470588235, blue: 0.7254901961, alpha: 0.2853763204)), radius: 21, x: 0, y: 21)
                .offset(y:-150)
            )
        }
            .padding(.bottom,30)
            
            
    }
}

struct MenuPage_Previews: PreviewProvider {
    static var previews: some View {
        MenuPage()
    }
}

struct MenuRow: View {
    var title: String
    var icon: String
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
                .frame(width:32, height: 32)
            Text(title)
                .imageScale(.large)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width:120, alignment: .leading)
        }
    }
}
