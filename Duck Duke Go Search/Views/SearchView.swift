//
//  SearchView.swift
//  Duck Duke Go Search
//
//  Created by Ricardo Developer on 10/04/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    
    @State private var SearchText = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Search")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
                
                SearchBar(text: $SearchText)
                
                List {
                    Section(header: Text("RESULTS")) {
                        ForEach(viewModel.searchResults, id: \.results) { index in
                            Text("\(ResultURL.self)")
                            
                            
                        }
                    }
                    Section(header: Text("Related Topics")) {
                        ForEach(viewModel.searchResults, id: \.relatedTopics) { index in
                            Text("\(RelatedTopic.self)")
                        }
                    }
                }
                
                .listStyle(GroupedListStyle())
            }
            
        }
    }
}



/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()*/
    



#Preview {
    SearchView()
}
