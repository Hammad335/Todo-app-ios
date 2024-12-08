//
//  ItemModel.swift
//  TodoIos
//
//  Created by Hamad on 08/12/2024.
//

import Foundation

struct ItemModel: Identifiable, Encodable, Decodable {
    let id: String
    let title: String
    let isCompleted: Bool

    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }

    func updateComletionStatus() -> ItemModel {
        ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
