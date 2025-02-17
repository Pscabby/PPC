//
//  Notificationtab.swift
//  PPC
//
//  Created by 李炘杰 on 2025/2/17.
//

import SwiftUI

struct Notificationtab: View {
    @Binding var isNotificationtabVisible: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
        }
        .foregroundStyle(.pink)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color.gray.opacity(0.4))
    }
}

#Preview {
    Notificationtab(isNotificationtabVisible: .constant(true))
}
