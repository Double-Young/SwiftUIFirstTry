//
//  TabView.swift
//  SwiftUIFirstTry
//
//  Created by Young on 2020/5/4.
//  Copyright © 2020 DoubleYoung. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            Home().tabItem{
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            ContentView().tabItem{
                Image(systemName: "rectangle.stack.fill")
                Text("Certificates")
            }
            UpdateList().tabItem{
                Image(systemName: "bell")
                Text("Updates")
            }
                
            }
        }
    }


struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
