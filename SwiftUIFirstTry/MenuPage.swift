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
                MenuRow(title: "Account", icon: "gear")
                MenuRow(title: "Billing", icon: "creditcard")
                MenuRow(title: "Sign out", icon: "person.crop.circle")
            }
            .frame( maxWidth: .infinity)
            .frame(height :300)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30,style: .continuous))
            .shadow(radius: 30)
            .padding(.horizontal,30)
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
                .frame(width:32, height: 32)
            Text(title)
                .imageScale(.large)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width:120, alignment: .leading)
        }
    }
}
