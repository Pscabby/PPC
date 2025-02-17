//
//  ContentView.swift
//  PPC
//
//  Created by 李炘杰 on 2025/2/16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isSidebarOpened = false //Check if the sidebar is opened
    @State private var isNotificationtabOpened = false //Check if the notification is opened
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Sidebar
                if isSidebarOpened {
                    Spacer()
                    Sidebar(isSidebarVisible: $isSidebarOpened)
                        .frame(width: 400)
                        .transition(.move(edge: .leading))
                }
                
                //Notificationtab
                if isNotificationtabOpened {
                    Spacer()
                    Notificationtab(isNotificationtabVisible: $isNotificationtabOpened)
                        .frame(width: 400)
                        .transition(.move(edge: .trailing))
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
                                .foregroundStyle(.pink)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .clipShape(Circle())
                        }
                            .offset(x: isSidebarOpened ? 320 : 0)
                            .opacity(isNotificationtabOpened ? 0 : 1)
                            .padding(), alignment: .topLeading
                    )
                    .overlay(
                        Button(action: {
                            withAnimation {
                                isNotificationtabOpened.toggle()
                            }
                        }) {
                            Image(systemName: isNotificationtabOpened ? "chevron.right" : "bell.fill")
                                .foregroundStyle(.pink)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .clipShape(Circle())
                        }
                            .offset(x: isNotificationtabOpened ? 0 : 320)
                            .opacity(isSidebarOpened ? 0 : 1)
                            .padding(), alignment: .topLeading
                            
                    )
                //Homepage Content
                Home()
                    .opacity(isSidebarOpened ? 0.1 : 1)
            }
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
