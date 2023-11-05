//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Yogesh Lamba on 05/11/23.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var listViewModel:ListViewModel=ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
