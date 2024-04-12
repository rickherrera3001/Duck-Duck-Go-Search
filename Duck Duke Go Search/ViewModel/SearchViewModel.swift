//
//  SearchViewModel.swift
//  Duck Duke Go Search
//
//  Created by Ricardo Developer on 10/04/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    
        @Published var searchResults: News?
        @Published var searchText: String = ""
        
        private let apiClient = ApiClient()
        
        
    func search(query: String) {
            apiClient.getSearchResult(query: query ) { result in
                switch result {
                case .success(let News):
                    self.searchResults = News
                case .failure(let error):
                    print("Error fetching search results: \(error)")
                }
            }
        }
    }

