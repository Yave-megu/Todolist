//
//  objects.swift
//  Todolist
//
//  Created by 김대한 on 2022/09/29.
//

import Foundation
class TodoLists: ObservableObject {
    @Published var list = [TodoList]()
}
struct TodoList: Identifiable, Codable {
    var id = UUID()
    var content: String
    var checked: Bool

}


