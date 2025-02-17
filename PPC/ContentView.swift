//
//  ContentView.swift
//  PPC
//
//  Created by 李炘杰 on 2025/2/16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isSidebarOpened = false //Check if the sidebar is opened
    
    var body: some View {
        ZStack {
            
            // Sidebar
            if isSidebarOpened {
                Spacer()
                Sidebar(isSidebarVisible: $isSidebarOpened)
                    .frame(width: 400)
                    .transition(.move(edge: .leading))
            }
            
            // Main Content
            MainView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(
                    Button(action: {
                        withAnimation {
                            isSidebarOpened.toggle()
                        }
                    }) {
                        Image(systemName: isSidebarOpened ? "chevron.left" : "line.3.horizontal")
                            .foregroundStyle(.black)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    }
                        .offset(x: isSidebarOpened ? 320 : 0)
                        .padding(), alignment: .topLeading
                )
        }
        
    }
}

struct MainView: View {
    var body: some View {
        Text("")
            .font(.largeTitle)
    }
}

#Preview {
    ContentView()
}
