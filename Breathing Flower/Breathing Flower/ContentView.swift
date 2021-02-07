//
//  ContentView.swift
//  Breathing Flower
//
//  Created by Christopher Bartling on 2/6/21.
//

import SwiftUI

struct ContentView: View {
    @State private var petal = false
    @State private var showShadow = false
    @State private var breathInLabel = true
    @State private var breathOutLabel = false
    @State private var breath = false
    @State private var diffuseExhale = false
    @State private var degrees: CGFloat = 0.0
    let backgroundColor = Color(UIColor.black)

    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            ZStack {
                Text("Breath In")
                    .font(Font.custom("papyrus", size: 35))
                    .foregroundColor(Color(UIColor.green))
                    .opacity(breathInLabel ? 0 : 1)
                    .scaleEffect(breathInLabel ? 0 : 1)
                    .offset(y: -160)
                    .animation(Animation.easeInOut(duration: 2)
                        .delay(2)
                        .repeatForever(autoreverses: true))

                Text("Breath Out")
                    .font(Font.custom("papyrus", size: 35))
                    .foregroundColor(Color(UIColor.orange))
                    .opacity(breathOutLabel ? 0 : 1)
                    .scaleEffect(breathOutLabel ? 0 : 1)
                    .offset(y: -160)
                    .animation(Animation.easeInOut(duration: 2)
                        .delay(2)
                        .repeatForever(autoreverses: true))

                VStack {
                    ZStack {
                        VStack {
                            Image("breath")
                                .resizable()
                                .frame(width: 35, height: 125)
                                .offset(y: breath ? 90 : 0)
                                .animation(Animation.timingCurve(0.65, -2.6, 0.32, 0.4)
                                    .delay(0.05)
                                    .speed(0.1)
                                    .repeatForever(autoreverses: true))
                        }
                        .blur(radius: diffuseExhale ? 1 : 60)
                        .offset(x: 0, y: diffuseExhale ? -50 : -100)

                        Petal(petal: $petal, degrees: petal ? -25 : -5)

                        Image("flower")
                            .resizable()
                            .frame(width: 75, height: 125)

                        Petal(petal: $petal, degrees: petal ? 25 : 5)

                        Petal(petal: $petal, degrees: petal ? -50 : -10)

                        Petal(petal: $petal, degrees: petal ? 50 : 10)

                        Image("bottomFlowers")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 400)
                            .rotationEffect(.degrees(37))
                            .offset(x: -25, y: 90)

                        Image("bottomFlowers")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 400)
                            .rotationEffect(.degrees(32))
                            .offset(x: -20, y: 190)
                    }
                    .shadow(radius: showShadow ? 20 : 0)
                    .animation(Animation.easeInOut(duration: 2)
                        .delay(2)
                        .repeatForever(autoreverses: true))
                }
            }
            .offset(y: -100)
        }
        .onAppear() {
            showShadow.toggle()
            petal.toggle()
            breathInLabel.toggle()
            breathOutLabel.toggle()
            breath.toggle()
            diffuseExhale.toggle()
        }
    }
}

struct Petal: View {
    @Binding var petal: Bool
    var degrees: Double = 0.00

    var body: some View {
        Image("flower")
            .resizable()
            .frame(width: 75, height: 125)
            .rotationEffect(.degrees(petal ? degrees : degrees), anchor: .bottom)
            .animation(Animation.easeInOut(duration: 2)
                .delay(2)
                .repeatForever(autoreverses: true))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
