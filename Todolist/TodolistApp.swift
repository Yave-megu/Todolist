//
//  TodolistApp.swift
//  Todolist
//
//  Created by κΉλν on 2022/09/29.
//

import SwiftUI

@main
struct todoListApp: App {
    
    @StateObject var todoLists = TodoLists()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(todoLists)
        }
    }
}
