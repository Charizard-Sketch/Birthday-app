//
//  Birthday_appApp.swift
//  Birthday app
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI
import SwiftData

@main
struct Birthday_appApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
