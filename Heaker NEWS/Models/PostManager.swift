//
//  PostManager.swift
//  Heaker NEWS
//
//  Created by JSworkstation on 2020/07/06.
//  Copyright © 2020 JSworkstation. All rights reserved.
//

import Foundation

var hackerNewsURL: String = "https://hn.algolia.com/api/v1/search?tags=front_page"

class PostManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let urlString = URL(string: hackerNewsURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: urlString) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let result = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = result.hits
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
