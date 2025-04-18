//
//  HomePage.swift
//  challenge2
//
//  Created by jiwon on 4/14/25.
//

import SwiftData
import SwiftUI

struct HomePage: View {

    @Environment(\.modelContext) private var context
    @Query private var balls: [Ball]

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
                        HStack {
                            Spacer()
                            Image(systemName: "shippingbox.fill").resizable()
                                .frame(
                                    width: 55, height: 55
                                ).foregroundColor(.cyellow).onTapGesture {
                                    path2.append(ArchivePath.list)
                                }.navigationDestination(for: ArchivePath.self) {
                                    route in
                                    switch route {
                                    case .list:
                                        ArchivePage(balls: balls, path2: $path2)
                                    case .detail(let ball):
                                        DetailPage(path2: $path2, ball: ball)
                                    case .update(let ball):
                                        UpdatePage(path2: $path2, ball: ball)
                                    case .doneUpdate(let ball):
                                        UpdatedPage(path2: $path2, ball: ball)
                                    }
                                }
                        }.padding(30)
                        //                    NavigationLink {
                        //                        ArchivePage()
                        //                    } label: {
                        //                        Image(systemName: "shippingbox.fill")
                        //                    }
                        Spacer().frame(height: 15)
                        VStack(alignment: .leading) {
                            (Text("지지").font(
                                .system(size: 32, weight: .bold))
                                + Text("님,").font(
                                    .system(size: 32))).foregroundColor(.cwhite)
                            Text("오늘은 어떤 것이 감사했나요?").foregroundColor(.cwhite)
                                .font(.system(size: 24))
                        }
                        Spacer().frame(height: 65)
                        Image("defaultball").resizable().frame(
                            width: 320, height: 320
                        ).onTapGesture {
                            path.append(Path.create)
                        }.navigationDestination(for: Path.self) {
                            route in
                            switch route {
                            case .create: CreatePage(path: $path)
                            case .selectDate(let content, let picData):
                                SelectDatePage(
                                    path: $path, content: content,
                                    picData: picData)
                            case .doneBall(let content, let picData):
                                MakeBallPage(
                                    path: $path, content: content,
                                    picData: picData)
                            }
                        }
                        //                    NavigationLink {
                        //                        CreatePage(path: $path)
                        //                    } label: {
                        //                        Image("defaultball").resizable().frame(
                        //                            width: 320, height: 320)
                        //                    }
                        Spacer().frame(height: 50)
                        (Text("구슬을 눌러 ").font(
                            .system(size: 18, weight: .bold))
                            + Text("감사한 일을 기록해보세요").font(.system(size: 18)))
                            .foregroundColor(
                                .cwhite)
                        Spacer()
                    }

                }
            }
        }
    }
}

#Preview {
    HomePage().modelContainer(for: Ball.self, inMemory: true)
}
