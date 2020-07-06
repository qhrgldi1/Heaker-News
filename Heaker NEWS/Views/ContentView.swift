//
//  ContentView.swift
//  Heaker NEWS
//
//  Created by JSworkstation on 2020/07/06.
//  Copyright © 2020 JSworkstation. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var postManager = PostManager()
    
    var body: some View {
        NavigationView {
            List(postManager.posts) { post in
                NavigationLink(destination: WebView(urlString: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("Hacker News")
        }
        .onAppear { self.postManager.fetchData() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
