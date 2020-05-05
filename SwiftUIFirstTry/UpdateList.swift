//
//  UpdateList.swift
//  SwiftUIFirstTry
//
//  Created by Young on 2020/5/4.
//  Copyright © 2020 DoubleYoung. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()
    func addUpdate(){
        store.updates.append(Update(title: "1", text: "2", date: "3", image: Image("Card1")))
    }
    var body: some View {
        
        NavigationView {
            List{
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetail(update: update)) {
                        HStack(alignment: .top) {
                            update.image
                                .resizable()
                                .aspectRatio(contentMode:.fit)
                                .cornerRadius(20)
                                .frame(width:80,height: 80)
                                .padding(.trailing,15)
                            
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))
                                
                                Text(update.text)
                                    .lineLimit(2)
                                    .foregroundColor(Color.secondary)
                                
                                Text(update.date.uppercased())
                                    .font(.system(size: 14, weight: .semibold))
                                    .padding(5)
                                    .foregroundColor(Color.white)
                                    .background(Color.black)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.vertical, 16.0)
                        
                    }
                }
                .onDelete{ index in
                    self.store.updates.remove(at: index.first!)
                }
                .onMove{(source: IndexSet, destin: Int) in
                    self.store.updates.move(fromOffsets: source, toOffset: destin)
                }
            }
            .navigationBarTitle(Text("Updates"))
            .navigationBarItems(leading: Button(action: self.addUpdate){Text("Add Update")},trailing: EditButton())
        }
        
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable{
    var id = UUID()
    var title: String
    var text: String
    var date: String
    var image: Image
}

let updatedData = [Update(title: "SwiftUI Advanced", text: "SwiftUI is hands-down the best way for designers to take a first step into code.", date:"nov 26", image: Image(uiImage: #imageLiteral(resourceName: "Avatar"))),
                   Update(title: "SwiftUI Advanced2", text: "SwiftUI is hands-down the best way for designers to take a first step into code.", date:"nov 26", image: Image(uiImage: #imageLiteral(resourceName: "Avatar"))),
                   Update(title: "SwiftUI Advanced3", text: "SwiftUI is hands-down the best way for designers to take a first step into code.", date:"nov 26", image: Image(uiImage: #imageLiteral(resourceName: "Avatar"))),
                   Update(title: "SwiftUI Advanced4", text: "SwiftUI is hands-down the best way for designers to take a first step into code.", date:"nov 26", image: Image(uiImage: #imageLiteral(resourceName: "Avatar")))
]
