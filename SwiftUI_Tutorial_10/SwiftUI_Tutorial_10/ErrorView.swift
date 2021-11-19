//
//  ErrorView.swift
//  SwiftUI_Tutorial_10
//
//  Created by Ata Anıl Turgay on 19.11.2021.
//

import SwiftUI

struct ErrorView: View {
    
    @ObservedObject var viewModel: TodoListViewModel
    
    var body: some View {
        Text("😞")
        Text("Failed")
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(viewModel: TodoListViewModel())
    }
}
