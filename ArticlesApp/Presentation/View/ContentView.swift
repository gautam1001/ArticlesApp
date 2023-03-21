//
//  ContentView.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import SwiftUI
import Combine

//MARK: Using Asyn-Await API
//struct ContentView: View {
//
//    @ObservedObject var viewModel: ContentViewModel
//
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }.task {
//            do {
//                print("\n============== Remote =================\n")
//                let articles = try await viewModel.fetchArticlesRemotely()
//                print(articles)
//                print("\n============== Save locally =================\n")
//                try await viewModel.saveToDevice()
//                print("\n============== Fetch from local storage =================\n")
//                let localArticles = try await viewModel.fetchArticlesLocally()
//                print(localArticles)
//            } catch {
//                print(error)
//            }
//
//        }
//        .padding()
//    }
//}

//MARK: Using Combine framework - AnyPublisher
struct ContentView: View {
   @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        List {
            ForEach(viewModel.articles) { enitity in
                Text(enitity.title ?? "No title")
            }
        }
        .onAppear {
           viewModel.fetchArticlesRemotely()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
