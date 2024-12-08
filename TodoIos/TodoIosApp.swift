//
//  TodoIosApp.swift
//  TodoIos
//
//  Created by Hamad on 06/12/2024.
//

import SwiftUI

@main
struct TodoIosApp: App {
    @StateObject var listViewModel: ListViewModel = .init()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
