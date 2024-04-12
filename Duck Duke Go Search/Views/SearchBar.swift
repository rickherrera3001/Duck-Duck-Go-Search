//
//  SearchBar.swift
//  Duck Duke Go Search
//
//  Created by Ricardo Developer on 10/04/24.
//

import SwiftUI

struct SearchBar: View {
    @State var viewModel = SearchViewModel()
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button(action: {
                // Acción al presionar el botón de búsqueda
                viewModel.search(query: text)
            }) {
                Text("Search")
            }
                .padding(.trailing)
        }
    }
}

/*#Preview {
    SearchBar()
}*/


