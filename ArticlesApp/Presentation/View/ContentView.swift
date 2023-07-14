//
//  ContentView.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import SwiftUI
import Combine

//MARK: Asyn-Await API Implementation

struct ContentView: View {

    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        List {
            ForEach(viewModel.articles) { enitity in
                Text(enitity.title ?? "No title")
            }
        }.onAppear {
            viewModel.fetchArticlesRemotely() // combine version
           /* Task {
                do {
                    print("\n============== Remote =================\n")
                    try await viewModel.fetchArticlesRemotely()
//                    print("\n============== Save locally =================\n")
//                    try await viewModel.saveToDevice()
//                    print("\n============== Fetch from local storage =================\n")
//                    try await viewModel.fetchArticlesLocally()
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
                
            }*/
        }
        
    }
}

//MARK: Combine framework - AnyPublisher Implementation

//struct ContentView: View {
//   @ObservedObject var viewModel: ContentViewModel
//
//    var body: some View {
//        List {
//            ForEach(viewModel.articles) { enitity in
//                Text(enitity.title ?? "No title")
//            }
//        }
//        .onAppear {
//           viewModel.fetchArticlesRemotely()
//        }
//    }
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
