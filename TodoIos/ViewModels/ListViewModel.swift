//
//  ListViewModel.swift
//  TodoIos
//
//  Created by Hamad on 08/12/2024.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            // didSet is called whenever 'items' value changes
            storeLocally()
        }
    }

    // user deafults key
    let itemsKey: String = "items_list"

    init() {
        getItems()
    }

    private func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let items = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }

        self.items = items
    }

    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }

    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    func addNewItem(title: String) {
        items.insert(ItemModel(title: title, isCompleted: false), at: 0)
    }

    func updateCompletionStatusOnTap(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateComletionStatus()
        }
    }

    func storeLocally() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
