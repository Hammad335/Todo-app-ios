//
//  TodoItemRowView.swift
//  TodoIos
//
//  Created by Hamad on 06/12/2024.
//

import SwiftUI

struct TodoItemRowView: View {
    let item: ItemModel

    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
                
            Spacer()
        }.font(.title2)
            .padding(.vertical, 2)
    }
}

#Preview {
    Group{
        TodoItemRowView(
            item: ItemModel(title: "This is first title",
                            isCompleted: false)
        )
        TodoItemRowView(
            item: ItemModel(title: "This is second title",
                            isCompleted: true)
        )
    }
}
