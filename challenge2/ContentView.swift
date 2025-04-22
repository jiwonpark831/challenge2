//
//  ContentView.swift
//  challenge2
//
//  Created by jiwon on 4/14/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {

    @Environment(\.modelContext) private var modelContext
    @Query private var balls: [Ball]

    @State var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            LoginPage(path: $path)
                .navigationDestination(for: Path.self) {
                    route in
                    switch route {
                    case .home: HomePage(path: $path)
                    case .create: CreatePage(path: $path)
                    case .selectDate(
                        let content, let picData):
                        SelectDatePage(
                            path: $path, content: content,
                            picData: picData)
                    case .doneBall(let content, let picData):
                        MakeBallPage(
                            path: $path, content: content,
                            picData: picData)
                    case .list:
                        ArchivePage(path: $path, balls: balls)
                    case .detail(let ball):
                        DetailPage(path: $path, ball: ball)
                    case .update(let ball):
                        UpdatePage(path: $path, ball: ball)
                    case .doneUpdate(let ball):
                        UpdatedPage(path: $path, ball: ball)
                    }
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Ball.self, inMemory: true)
}
