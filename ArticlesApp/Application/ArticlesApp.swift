//
//  ArticlesAppApp.swift
//  ArticlesApp
//
//  Created by Prashant Gautam on 01/11/22.
//

import SwiftUI

@main
struct ArticlesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: AppDI().articlesDI())
        }
    }
}
