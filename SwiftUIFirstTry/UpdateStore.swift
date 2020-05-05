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
