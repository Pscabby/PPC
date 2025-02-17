//
//  Sidebar.swift
//  PPC
//
//  Created by 李炘杰 on 2025/2/16.
//

import SwiftUI

struct Sidebar: View {
    
    @Binding var isSidebarVisible: Bool
    
    struct MenuItem: Identifiable {
        var id: Int
        var icon: String
        var text: String
    }
    
    struct UserProfile: View {
        var body: some View {
            
            Button(action: {
                
            }) {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text(" 會員資料")
                        .font(.largeTitle)
                }
                .padding()
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
    
    let menuItems: [MenuItem] = [
        MenuItem(id: 1001, icon: "person.circle.fill", text: "算呼吸"),
        MenuItem(id: 1002, icon: "bag.fill", text: "寵物"),
        MenuItem(id: 1003, icon: "gift.fill", text: "附近醫院"),
        MenuItem(id: 1004, icon: "waveform.path.ecg", text: "怎麼計算呼吸速率"),
        MenuItem(id: 1005, icon: "questionmark.circle.fill", text: "其他議題"),
        MenuItem(id: 1006, icon: "info.circle.fill", text: "關於算算")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            UserProfile()
            ForEach(menuItems) { item in
                Button(action: {
                    
                }) {
                    HStack {
                        Image(systemName: item.icon)
                        Text(item.text)
                            .font(.title)
                            .padding(.vertical, 5)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color.gray.opacity(0.4))
    }
}


#Preview {
    Sidebar(isSidebarVisible: .constant(true))
}
