//
//  textFieldView.swift
//  Todolist
//
//  Created by 김대한 on 2022/09/29.
//

import SwiftUI

struct TextFieldView: View {
    
    @State var toDoString = ""
    @EnvironmentObject var todoLists : TodoLists
    
    var body: some View {
        // 이전에 했던 것과 동일
        HStack {
            Image(systemName: "square.and.pencil")
            TextField("your task",
                      text: $toDoString,
                      onCommit: {appendList()}
            )
        }
        .textFieldStyle(DefaultTextFieldStyle())
        .frame(width: 300, height: 50, alignment: .center)
    }
    
    func appendList() {
        let inputList = TodoList(content: toDoString, checked: false)
        
        // todoLists가 todoList 배열 그 자체에서
        // todoList 배열 list를 갖는 객체가 되었기 때문에 수정
        todoLists.list.append(inputList)
        toDoString = ""
     }
}
