//
//  LoadingView.swift
//  SwiftUI_Tutorial_10
//
//  Created by Ata Anıl Turgay on 19.11.2021.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        Text("Loading")
        ProgressView()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
