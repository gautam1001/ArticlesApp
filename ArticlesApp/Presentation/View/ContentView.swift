//
//  ContentView.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import SwiftUI

struct ContentView: View {
    let viewModel: ContentViewModel
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }.task {
            do {
                print("\n============== Remote =================\n")
                let articles = try await viewModel.fetchArticlesRemotely()
                print(articles)
                try await viewModel.saveToDevice()
                print("\n============== Local =================\n")
                let localArticles = try await viewModel.fetchArticlesLocally()
                print(localArticles)
            } catch {
                print(error)
            }
        }
        .padding()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
