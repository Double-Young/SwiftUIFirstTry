//
//  ContentView.swift
//  SwiftUIFirstTry
//
//  Created by Young on 2020/5/3.
//  Copyright © 2020 DoubleYoung. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = true
    @State var viewState = CGSize.zero
    @State var showCard = false
    @State var bottomState = CGSize.zero
    @State var showFull = false
    
    var body: some View {
        ZStack {
            HeaderView()
                .blur(radius: self.show ? 0 : 20)
                .opacity(showCard ? 0.4 : 1)
                .offset( y: showCard ? -150 :0)
                .animation(Animation.timingCurve(0.2,0.8,0.2,1,duration: 0.8))
            
            BackCard()
            .frame(width: showCard ? 300 : 340, height:220)
            .background(Color(self.show ? "card4" : "card3"))
            .cornerRadius(20)
            .shadow(radius: 20)
            .offset(x: 0, y: self.show ? -40 : -350)
            .offset(x: viewState.width, y: viewState.height)
            .offset( y: showCard ? -140: -40)
            .scaleEffect(showCard ? 1 :0.9)
            .rotationEffect(.degrees(self.show ? 10: 0))
            .rotationEffect(.degrees(self.showCard ? -10: 0))
            .rotation3DEffect(Angle(degrees: showCard ? 0:10), axis: (x: 10, y: 0, z: 0))
            .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            BackCard()
            .frame(width: 340, height:220)
            .background(Color(self.show ? "card3" : "card4"))
            
            .cornerRadius(20)
            .shadow(radius: 20)
            .offset(x: 0, y: self.show ? -20: -200)
            .offset(x: viewState.width, y: viewState.height)
            .offset( y: showCard ? -120 : -20)
                .scaleEffect(showCard ? 1 :0.95)
            .rotationEffect(.degrees(self.show ? 5: 0))
            .rotationEffect(.degrees(self.showCard ? -5: 0))
            .rotation3DEffect(Angle(degrees: showCard ? 0:5), axis: (x: 10, y: 0, z: 0))
            .blendMode(.hardLight)
            .animation(.easeInOut(duration: 0.3))
            
            CardView()
                .frame(width: showCard ? 375: 340.0, height: 220.0)
//                .frame(maxWidth:.infinity)
               .background(Color.black)
//               .cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius:showCard ? 30 :20, style: .continuous))
               .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .offset( y: showCard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
//                    self.show.toggle()
                    self.showCard.toggle()
            }
                .gesture(DragGesture()
                .onChanged{ value in
                    self.viewState = value.translation
                    self.show = false
                    }
                .onEnded{ value in
                    self.viewState = CGSize.zero
                    self.show = true
                    }
                )
                
            
//            Text("\(bottomState.height)").offset(y:-360)
            
            BottomCardView()
//            .blur(radius: self.show ? 0 : 20)
                .offset(y: showCard ? 400 : 1000)
                .offset(y: bottomState.height)
                .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0))
                .gesture(
                    DragGesture().onChanged{ value in
                        self.bottomState = value.translation
                        if self.showFull {
                            self.bottomState.height += -350
                        }
                        if self.bottomState.height < -350{
                            self.bottomState.height = -350
                        }
                    }
                    .onEnded{ value in
                        if self.bottomState.height >= 50{
                            self.showCard = false
                            
                        }
                        if (self.bottomState.height <= -200 && !self.showFull) || (self.bottomState.height <= -350 && self.showFull){
                            self.bottomState.height = -350
                            self.showFull = true
                        }else {
                            self.bottomState = CGSize.zero
                            self.showFull = false
                        }
                    }
            )
                
        }
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Hello, World!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    Text("Cards having animations")
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            .padding(.horizontal,20)
            .padding(.top,20)
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300.0, height: 110.0, alignment: .top)
        }
       
    }
}

struct BackCard: View {
    var body: some View {
        VStack {
            Spacer()
        }
        
        
    }
}

struct HeaderView: View {
    var body: some View {
        VStack {
            HStack {
                Text("SwiftUI Course")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 20)
                    .padding(.top, 40)
                
                Spacer()
            }
            Image("Background1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack (spacing: 20){
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
                .frame(maxWidth:.infinity)
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
