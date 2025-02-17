//
//  Home.swift
//  PPC
//
//  Created by 李炘杰 on 2025/2/17.
//

import SwiftUI

struct Home: View {
    @State private var breathCount = 0
    var isRest = true
    let mainColor = Color(red: 255/255, green: 105/255, blue: 161/255, opacity: 1)
    
    var body: some View {
        VStack{
            ZStack{
                TimerView()
                
                Button(action: {
                    breathCount += 1
                }) {
                    Image("lung")
                        .resizable()
                        .frame(width: 300, height: 250)
                }
            }
            VStack{
                Text(isRest ? "休息時" : "費力時")
                Text("呼吸速率")
                Text("\(breathCount)")
                Text("次/分鐘")
            }
            .font(.title)
            .foregroundStyle(mainColor)
            
        }
        
    }
    
    // 60s Timer
    struct TimerView: View {
        @State private var timeRemaining: CGFloat = 60
        let totalTime: CGFloat = 60
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        var body: some View {
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 15)
                Circle()
                    .trim(from: 0, to: 1 - timeRemaining / totalTime)
                    .stroke(Color.pink, lineWidth: 15)
                    .rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 1), value: timeRemaining)
            }
            .frame(width: 350, height: 350)
            .onReceive(timer) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
        }
    }
}

#Preview {
    Home()
}
