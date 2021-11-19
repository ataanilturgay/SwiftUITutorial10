//
//  TodoListRowView.swift
//  SwiftUI_Tutorial_10
//
//  Created by Ata Anıl Turgay on 19.11.2021.
//

import SwiftUI

struct TodoListRowView: View {
    let todo: TodoModel
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(todo.title) - \(todo.userId)")
                .font(.subheadline)
        }
    }
}

struct TodoListRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        TodoListRowView(todo: TodoModel(userId: 123,
                                        id: 11423432,
                                        title: "Title",
                                        completed: false))
    }
}
