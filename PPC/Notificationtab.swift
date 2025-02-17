//
//  Notificationtab.swift
//  PPC
//
//  Created by 李炘杰 on 2025/2/17.
//

import SwiftUI

struct Notificationtab: View {
    @Binding var isNotificationtabVisible: Bool
    
    struct NotificationItem: Identifiable {
        var id: Int
        var time: String
        var text: String
        var mission: String
    }
    
    let defaulttime = Date.now
    
    let NotificationItems: [NotificationItem] = [
        NotificationItem(id: 3001, time: "20:38", text: "該算 阿寶 的呼吸速率囉", mission: ""),
        NotificationItem(id: 3002, time: "20:41", text: "寶媽 的共同照護邀請", mission: ""),
        NotificationItem(id: 3003, time: "20:43", text: "寶寶 的共同照護邀請", mission: ""),
        NotificationItem(id: 3004, time: "20:47", text: "該算 阿寶 的休息呼吸速率囉", mission: ""),
        NotificationItem(id: 3005, time: "20:51", text: "該算 包子 的呼吸速率囉", mission: ""),
        NotificationItem(id: 3006, time: "20:57", text: "該更新密碼囉", mission: ""),
        NotificationItem(id: 3007, time: "21:00", text: "該讓 阿寶 休息囉", mission: "")
    ]
    
    
    var body: some View {
        VStack {
            Text("通知")
                .font(.largeTitle)
                .padding()
            ForEach(NotificationItems) { item in
                Button(action: {
                }) {
                    HStack {
//                        Spacer()
                        Text(item.text)
                            .font(.title2)
                        Text(item.time)
                            .font(.headline)
                            .padding(.horizontal, 5)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    
                }
                .buttonStyle(PlainButtonStyle())
                Divider().background(Color.black).frame(height: 3)
            }
            Spacer()
        }
        .foregroundStyle(.pink)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
        .background(Color.gray.opacity(0.4))
    }
}

#Preview {
    Notificationtab(isNotificationtabVisible: .constant(true))
}
