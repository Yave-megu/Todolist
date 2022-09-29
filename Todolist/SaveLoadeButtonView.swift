//
//  SaveLoadeButtonView.swift
//  Todolist
//
//  Created by 김대한 on 2022/09/29.
//

import SwiftUI

struct SaveLoadButtonView: View {
    
    @EnvironmentObject var todoLists: TodoLists
    
    var body: some View {
        HStack(spacing: 50) {
            Button("Save", action: {saveTodoList()})
                    .padding(.all, 10)
            Button("Load", action: {loadTodoList()})
                    .padding(.all, 10)
        }
    }
    
    func saveTodoList() {
        let path = getDocumentPath().appendingPathComponent("todolist.json")
        let jsonString = dataToJsonString()
        
        // dataToJsonString() 함수의 반환형이 String? 이므로, nil인 경우에 대한 처리를 해 줬다.
        if jsonString == nil {
            print("Error: No JSON String found")
            return
        }
        
        do {
            try jsonString?.write(to: path, atomically: true, encoding: .utf8)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func loadTodoList() {
        
        let path = getDocumentPath().appendingPathComponent("todolist.json")
        
        do {
            let jsonString = try String(contentsOf: path)
            let jsonData = jsonStringToData(jsonString)
            
            if jsonData == nil {
                print("Error: No JSON Data found")
                return
            }
            
            // todoLists -> todoLists.list
            todoLists.list = jsonData!
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func dataToJsonString() -> String? {
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            // todoLists -> todoLists.list
            let data = try encoder.encode(todoLists.list)
            return String(data: data, encoding: .utf8)
        }
        catch {
            print(error.localizedDescription)
        }
        
        return nil
    }

    func getDocumentPath() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func jsonStringToData(_ jsonString: String) -> [TodoList]? {
        let decoder = JSONDecoder()
        let jsonData = jsonString.data(using: .utf8)
        
        if jsonData == nil {
            print("Error: Cannot convert json String to Data")
            return nil
        }
        
        do {
            let returnList = try decoder.decode([TodoList].self, from: jsonData!)
            return returnList
        }
        catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
