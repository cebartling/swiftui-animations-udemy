//
//  ContentView.swift
//  Animating Circles
//
//  Created by Christopher Bartling on 2/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scaleInOut = false
    @State private var rotateInOut = false
    @State private var moveInOut = false
    
    private let yellowGradient = Gradient(colors: [.yellow, .white])
    private let blueGradient = Gradient(colors: [.blue, .white])
    private let redGradient = Gradient(colors: [.red, .white])

    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ZStack {
                //MARK: - Circles set 1
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: yellowGradient,
                                             startPoint: .top,
                                             endPoint: .bottom))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? -60 : 0)

                    Circle()
                        .fill(LinearGradient(gradient: yellowGradient,
                                             startPoint: .top,
                                             endPoint: .bottom))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? 60 : 0)
                }
                .opacity(0.5)
                
                //MARK: - Circles set 2
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: blueGradient,
                                             startPoint: .top,
                                             endPoint: .bottom))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? -60 : 0)

                    Circle()
                        .fill(LinearGradient(gradient: blueGradient,
                                             startPoint: .top,
                                             endPoint: .bottom))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? 60 : 0)
                }
                .opacity(0.5)
                .rotationEffect(.degrees(60))
                
                //MARK: - Circles set 3
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: redGradient,
                                             startPoint: .top,
                                             endPoint: .bottom))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? -60 : 0)

                    Circle()
                        .fill(LinearGradient(gradient: redGradient,
                                             startPoint: .top,
                                             endPoint: .bottom))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? 60 : 0)
                }
                .opacity(0.5)
                .rotationEffect(.degrees(120))
            }
            .rotationEffect(.degrees(rotateInOut ? 90 : 0))
            .scaleEffect(scaleInOut ? 1.25 : 1/24)
            .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(1/8))
            .onAppear {
                moveInOut.toggle()
                scaleInOut.toggle()
                rotateInOut.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
