//
//  ContentView.swift
//  SwiftUI_Tutorial_10
//
//  Created by Ata Anıl Turgay on 19.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = TodoListViewModel()
    
    var body: some View {
        if viewModel.isLoading {
            LoadingView()
        } else if viewModel.errorMessage != nil {
            ErrorView(viewModel: viewModel)
        } else {
            TodoListView(todoList: viewModel.todoList)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
