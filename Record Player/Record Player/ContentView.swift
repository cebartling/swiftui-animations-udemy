//
//  ContentView.swift
//  Record Player
//
//  Created by Christopher Bartling on 2/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotateRecord = false
    @State private var rotateArm = false
    @State private var shouldAnimate = false
    @State private var degrees = 0.0
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.white, Color.black]),
                           center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
                           startRadius: 20,
                           endRadius: 600)
                .scaleEffect(1.2)
            
            RecordPlayerBoxView()
                .offset(y: -100)
            
            VStack {
                RecordView(degrees: $degrees, shouldAnimate: $shouldAnimate)
                
                ArmView(rotateArm: $rotateArm)
                
                Button(action:  {
                    shouldAnimate.toggle()
                    rotateRecord.toggle()
                    rotateArm.toggle()
                    if shouldAnimate {
                        degrees = 72000
                        playSound(sound: "music", type: "m4a")
                    } else {
                        degrees = 0
                        audioPlayer?.stop()
                    }
                }) {
                    HStack(spacing: 8) {
                        if !shouldAnimate {
                            Text("Play")
                            Image(systemName: "play.circle.fill")
                                .imageScale(.large)
                        } else {
                            Text("Stop")
                            Image(systemName: "stop.fill")
                                .imageScale(.large)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Capsule().strokeBorder(Color.black, lineWidth: 1.25))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
