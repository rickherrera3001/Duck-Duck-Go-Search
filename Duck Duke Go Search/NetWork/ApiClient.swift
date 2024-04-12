//
//  ApiClient.swift
//  Duck Duke Go Search
//
//  Created by Ricardo Developer on 10/04/24.
//

import Foundation

class ApiClient {
    
    func getSearchResult(query: String ,completion: @escaping (Result<News, Error>) -> Void) {
        let urlString = "https://api.duckduckgo.com/?q=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&format=json&pretty=1"
        
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "URL is not valid"])
            completion(.failure(error))
            return
        }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
            
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

