//
//  HomePage.swift
//  challenge2
//
//  Created by jiwon on 4/14/25.
//

import SwiftUI

struct HomePage: View {

    @State var path = NavigationPath()
    @State var path2 = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            NavigationStack(path: $path2) {
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [
                            .cpurple, .cyellow,
                        ]),
                        startPoint: .top, endPoint: .bottom
                    )
                    .ignoresSafeArea(.all)

                    VStack {
                        Image(systemName: "shippingbox.fill").onTapGesture {
                            path2.append(ArchivePath.list)
                        }.navigationDestination(for: ArchivePath.self) {
                            route in
                            switch route {
                            case .list: ArchivePage(path2: $path2)
                            case .detail: DetailPage(path2: $path2)
                            case .update: UpdatePage(path2: $path2)
                            case .doneUpdate: UpdatedPage(path2: $path2)
                            }
                        }
                        //                    NavigationLink {
                        //                        ArchivePage()
                        //                    } label: {
                        //                        Image(systemName: "shippingbox.fill")
                        //                    }

                        Text("지지님,")
                        Text("오늘은 어떤 것이 감사했나요")

                        Image("defaultball").resizable().frame(
                            width: 320, height: 320
                        ).onTapGesture {
                            path.append(Path.create)
                        }.navigationDestination(for: Path.self) {
                            route in
                            switch route {
                            case .create: CreatePage(path: $path)
                            case .selectDate: SelectDatePage(path: $path)
                            case .doneBall: MakeBallPage(path: $path)
                            }
                        }
                        //                    NavigationLink {
                        //                        CreatePage(path: $path)
                        //                    } label: {
                        //                        Image("defaultball").resizable().frame(
                        //                            width: 320, height: 320)
                        //                    }

                        Text("구슬을 눌러 감사한 일을 기록해보세요")

                    }

                }
            }
        }
    }
}

#Preview {
    HomePage()
}
