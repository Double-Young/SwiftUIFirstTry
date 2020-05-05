//
//  UpdateDetail.swift
//  SwiftUIFirstTry
//
//  Created by Young on 2020/5/4.
//  Copyright © 2020 DoubleYoung. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    var update = updatedData[0]//设置默认值
    var body: some View {
        
        List {
            VStack {
                update.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth:.infinity)
                Text(update.text)
                    .frame(maxWidth:.infinity,alignment: .leading)
            }
            .navigationBarTitle(update.title)
        }
    .listStyle(PlainListStyle())
        
        
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
