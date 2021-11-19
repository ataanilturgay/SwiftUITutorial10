//
//  TodoListViewModel.swift
//  SwiftUI_Tutorial_10
//
//  Created by Ata Anıl Turgay on 19.11.2021.
//

import Foundation

class TodoListViewModel: ObservableObject {
    
    @Published var todoList = [TodoModel]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        fetchTodoList()
    }
    
    func fetchTodoList() {
        self.isLoading = true
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/todosgdgdf")
        APIClient.shared.fetchTodoList(url: url) { [weak self] result in
            
            guard let self = self else { return }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.isLoading = false
                
                switch result {
                case .success(let response):
                    self.todoList = response
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
