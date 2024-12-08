//
//  ListView.swift
//  TodoIos
//
//  Created by Hamad on 06/12/2024.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(.opacity.animation(.easeInOut))
            }
            else {
                List {
                    ForEach(listViewModel.items) { item in
                        TodoItemRowView(item: item)
                            .onTapGesture {
                                withAnimation(
                                    .linear,
                                    {
                                        listViewModel.updateCompletionStatusOnTap(item: item)
                                    }
                                )
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }

        .listStyle(.plain)
        .contentMargins(.top, 20)
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink(
                "Add",
                destination: AddView()
            )
        )
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}
