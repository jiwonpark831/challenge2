//
//  challenge2App.swift
//  challenge2
//
//  Created by jiwon on 4/14/25.
//

import SwiftData
import SwiftUI

@main
struct challenge2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Ball.self)
    }
}
