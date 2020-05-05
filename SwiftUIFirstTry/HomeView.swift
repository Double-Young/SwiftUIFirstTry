//
//  HomeView.swift
//  SwiftUIFirstTry
//
//  Created by Young on 2020/5/4.
//  Copyright © 2020 DoubleYoung. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size:28))
                    .fontWeight(.bold)
                Spacer()
                AvatarView(showProfile: $showProfile)
                Button(action: {self.showUpdate.toggle()}) {
                Image(systemName: "bell")
                .renderingMode(.original)
                .font(.system(size: 16, weight:.medium))
                }
                .frame(width:36,height: 36)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 20)
                .sheet(isPresented: $showUpdate){
                    UpdateList()
                }
                
                
            }
            .padding(.horizontal)
            .padding(.top, 30)
            .padding(.leading, 14)
            

            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing:16) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            
                            SectionView(section: item)
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX-30) / -20), axis: (x: 0, y: 1, z: 0))
                             
                        }
                        .frame(width:275,height: 275)
                    }
                }
            .padding(30)
            .padding(.bottom,30)
            }
            
            
            
            
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var section: Section
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .frame(width:160, alignment: .leading)
                    .foregroundColor(Color.white)
                    .lineLimit(3)
                Spacer()
                Image(section.logo)
            }
            
            Text(section.text.uppercased())
                .frame(maxWidth:.infinity,alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:210)
        }
        .padding(.top,20)
        .padding(.horizontal,20)
        .frame(width:275,height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(title: "Prototype designs in SwiftUI", text: "18 sections", logo: "Logo1", image: Image(uiImage:#imageLiteral(resourceName: "Card2")), color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))),
    Section(title: "Prototype designs in SwiftUI", text: "18 sections", logo: "Logo1", image: Image(uiImage:#imageLiteral(resourceName: "Card4")), color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))),
    Section(title: "Prototype designs in SwiftUI", text: "18 sections", logo: "Logo1", image: Image(uiImage:#imageLiteral(resourceName: "Card5")), color: Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))),
    Section(title: "Prototype designs in SwiftUI", text: "18 sections", logo: "Logo1", image: Image(uiImage:#imageLiteral(resourceName: "Card1")), color: Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)))
]


