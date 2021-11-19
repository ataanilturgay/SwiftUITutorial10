//
//  TodoListView.swift
//  SwiftUI_Tutorial_10
//
//  Created by Ata Anıl Turgay on 19.11.2021.
//

import SwiftUI

struct TodoListView: View {
    
    let todoList: [TodoModel]
    
    var body: some View {
        List {
            ForEach(self.todoList) { todo in
                VStack(alignment: .leading, spacing: 8) {
                    TodoListRowView(todo: todo)
                }
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(todoList: [TodoModel]())
    }
}
