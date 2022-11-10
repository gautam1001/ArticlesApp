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
                let articles = try await viewModel.fetchArticles()
                print(articles)
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
