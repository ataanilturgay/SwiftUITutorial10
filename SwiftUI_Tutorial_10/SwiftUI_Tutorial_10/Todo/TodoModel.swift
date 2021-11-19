//
//  TodoModel.swift
//  SwiftUI_Tutorial_10
//
//  Created by Ata Anıl Turgay on 19.11.2021.
//

import Foundation

struct TodoModel: Decodable, Identifiable {
    
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
