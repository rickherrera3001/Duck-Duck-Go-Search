//
//  SearchView.swift
//  Duck Duke Go Search
//
//  Created by Ricardo Developer on 10/04/24.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    
    @State private var SearchText = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Search")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                SearchBar(viewModel: viewModel, text: $SearchText)
                
                List {
                    Section(header: Text("RESULTS")) {
                        ForEach(viewModel.searchResults?.results ??  [], id: \.result) {
                            item in
                            VStack (alignment: .leading) {
                                Text(item.text ?? "")
                                    .font(.headline)
                                Text(item.firstURL ?? "")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                            
                            }
                                    }
                    }
                    Section(header: Text("Related Topics")) {
                        ForEach(viewModel.searchResults?.relatedTopics ?? [], id: \.result) { index in
                            VStack(alignment: .leading) {
                                Text("\(index.result)")
                                Text("\(index.firstURL)")
                            }
                        }
                    }
                }
                
                .listStyle(GroupedListStyle())
            }
                                    
        }
                                    
    }
}

                                    
#Preview {
    SearchView()
}


