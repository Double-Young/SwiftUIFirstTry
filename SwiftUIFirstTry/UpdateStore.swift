//
//  SwiftUIView.swift
//  SwiftUIFirstTry
//
//  Created by Young on 2020/5/4.
//  Copyright © 2020 DoubleYoung. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject{
    @Published var updates: [Update] = updatedData
}

//class PecentStore: ObservableObject{
//    @Published var pecent: CGFloat = startp
//}

struct UpdateStore_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
