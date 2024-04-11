//
//  ApiClient.swift
//  Duck Duke Go Search
//
//  Created by Ricardo Developer on 10/04/24.
//

import Foundation

class ApiClient {
    
    func getSearchResults(completion: @escaping (Result<News, Error>) -> Void) {
        
        var request = URLRequest(url: URL(string: "https://api.duckduckgo.com/?q=American%2BAirlines&format=json&pretty=1")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        
        let _: Void = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error)")
                    
                } else {
                    print("No data recived")
                }
                
                return
            }
            print(String(data: data, encoding: .utf8)!)
            
            do {
                let result = try JSONDecoder().decode(News.self, from: data)
                
                completion(.success(result))
                
            } catch {
                print("Error decoding JSON: \(error)")
                completion(.failure(error))
            }
            
            
        }.resume()
        }
    }
