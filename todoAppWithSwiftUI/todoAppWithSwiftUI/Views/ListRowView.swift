//
//  ListRowView.swift
//  todoAppWithSwiftUI
//
//  Created by Нурдаулет on 31.03.2024.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    init(item: ItemModel) {
        self.item = item
    }
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title3)
        .padding(.vertical, 8)
    }
}
