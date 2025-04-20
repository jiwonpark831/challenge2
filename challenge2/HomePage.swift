//
//  HomePage.swift
//  challenge2
//
//  Created by jiwon on 4/14/25.
//

import SwiftData
import SwiftUI
import UIKit

//모션감지 따와서 적용만 시켜둔거라.. 분석 필요
class ShakeDetectingViewController: UIViewController {
    var onShake: (() -> Void)?

    override func motionEnded(
        _ motion: UIEvent.EventSubtype, with event: UIEvent?
    ) {
        if motion == .motionShake {
            onShake?()
        }
    }
}

struct ShakeDetector: UIViewControllerRepresentable {
    var onShake: () -> Void

    func makeUIViewController(context: Context) -> ShakeDetectingViewController
    {
        let controller = ShakeDetectingViewController()
        controller.onShake = onShake
        return controller
    }

    func updateUIViewController(
        _ uiViewController: ShakeDetectingViewController, context: Context
    ) {}
}

struct HomePage: View {

    @Environment(\.modelContext) private var context
    @Query private var balls: [Ball]

    @State var path = NavigationPath()
    @State var path2 = NavigationPath()

    private var questions: [String] = [
        "오늘은 어떤 것이 감사했나요?",
        "마음이 따뜻해진 일이 있나요?",
        "고마움을 느낀 일이 있었나요?",
        "작은 감사를 떠올려볼까요?",
        "미소 짓게 했던 것이 있나요?",
        "지금 떠오르는 감사가 있나요?",
        "작은 고마움을 기록해볼까요?",
        "오늘의 특별한 감사가 있나요?",
        "감사의 순간을 기록해보세요",
        "오늘의 감사를 남겨보세요",
    ]

    @State private var todayBallExist: Bool = false
    @State private var todayBall: [Ball] = []

    @State private var showBallPopUp: Bool = false
    @State private var todayBallCount: Int = 0
    @State private var todayBallCountIndex: Int = 0

    @State private var openAllTodayBall: Bool = false

    var body: some View {
        NavigationStack(path: $path) {
            NavigationStack(path: $path2) {
                ZStack {
                    if !todayBallExist {
                        LinearGradient(
                            gradient: Gradient(colors: [
                                .cpurple, .cyellow,
                            ]),
                            startPoint: .top, endPoint: .bottom
                        ).ignoresSafeArea(.all)
                    } else {
                        LinearGradient(
                            gradient: Gradient(colors: [
                                .cyellow, .cpurple,
                            ]),
                            startPoint: .top, endPoint: .bottom
                        ).ignoresSafeArea(.all)
                    }

                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "shippingbox.fill").resizable()
                                .frame(
                                    width: 55, height: 55
                                ).foregroundColor(
                                    !todayBallExist ? .cyellow : .cpurple
                                ).onTapGesture {
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

                        HStack {
                            VStack(alignment: .leading) {
                                (Text(
                                    "\(UserDefaults.standard.string(forKey: "username") ?? "Guest")"
                                ).font(
                                    .system(size: 32, weight: .bold))
                                    + Text("님,").font(
                                        .system(size: 32))).foregroundColor(
                                        .cwhite)
                                let question = questions.randomElement()
                                if !todayBallExist {
                                    if !openAllTodayBall {
                                        Text(
                                            "\(question ?? "오늘은 어떤 것이 감사했나요?")"
                                        )
                                        .foregroundColor(.cwhite)
                                        .font(.system(size: 24)).frame(
                                            width: 290, alignment: .leading)
                                    } else {
                                        Text("감사 구슬이 빛나고 있어요").foregroundColor(
                                            .cwhite
                                        )
                                        .font(.system(size: 24)).frame(
                                            width: 290, alignment: .leading)
                                    }
                                } else {
                                    Text("오늘 열어볼 감사 구슬이 도착했어요").foregroundColor(
                                        .cwhite
                                    )
                                    .font(.system(size: 20)).frame(
                                        width: 290, alignment: .leading)
                                }
                            }
                            Spacer()
                        }.padding(.leading, 35)
                        if !openAllTodayBall {
                            Spacer().frame(height: 65)
                        } else {
                            Spacer().frame(height: 40)
                        }
                        if !todayBallExist {
                            if !openAllTodayBall {
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
                            } else {
                                Image("openball").resizable().frame(
                                    width: 400, height: 400
                                )
                            }
                        } else {
                            ZStack {
                                Image("closeball").resizable().frame(
                                    width: 320, height: 320
                                )
                                ShakeDetector {
                                    showBallPopUp.toggle()
                                }
                            }.fullScreenCover(
                                isPresented: $showBallPopUp,
                                onDismiss: {
                                    todayBallCountIndex += 1
                                    if todayBallCountIndex < todayBallCount {
                                        showBallPopUp = true
                                    } else {
                                        todayBallCountIndex = 0
                                        todayBallExist = false
                                        openAllTodayBall = true
                                        DispatchQueue.main.asyncAfter(
                                            deadline: .now() + 10
                                        ) {
                                            openAllTodayBall = false

                                        }
                                    }
                                }
                            ) {

                                VStack {
                                    Text(
                                        todayBall[todayBallCountIndex]
                                            .createDate
                                    ).foregroundColor(.ctext).font(
                                        .system(size: 24, weight: .bold))
                                    Spacer().frame(height: 30)
                                    if let uiImage = UIImage(
                                        data: todayBall[todayBallCountIndex]
                                            .image)
                                    {
                                        Image(uiImage: uiImage).resizable()
                                            .scaledToFit().frame(
                                                width: 250
                                            ).cornerRadius(15)
                                    }
                                    Spacer().frame(height: 30)
                                    Text(todayBall[todayBallCountIndex].content)
                                        .foregroundColor(.cpurple).font(
                                            .system(size: 18))
                                }.onTapGesture {
                                    todayBall[todayBallCountIndex].isOpen = true
                                    showBallPopUp = false
                                }.presentationBackground(.ultraThinMaterial)
                            }
                            //                            }.transaction {
                            //                                transaction in
                            //                                transaction.disablesAnimations = true
                            //                            }
                        }
                        //                    NavigationLink {
                        //                        CreatePage(path: $path)
                        //                    } label: {
                        //                        Image("defaultball").resizable().frame(
                        //                            width: 320, height: 320)
                        //                    }
                        Spacer().frame(height: 50)
                        if !todayBallExist {
                            if !openAllTodayBall {
                                (Text("구슬을 눌러 ").font(
                                    .system(size: 18, weight: .bold))
                                    + Text("감사한 일을 기록해보세요").font(
                                        .system(size: 18)))
                                    .foregroundColor(
                                        .cwhite)
                            } else {
                                Text("오늘도 감사가 넘치는 하루 보내세요").font(
                                    .system(size: 18)
                                )
                                .foregroundColor(
                                    .cwhite)
                            }
                        } else {
                            (Text("핸드폰을 ").font(.system(size: 18)))
                                .foregroundColor(
                                    .cwhite)
                                + Text("흔들어 ").font(
                                    .system(size: 18, weight: .bold)
                                ).foregroundColor(
                                    .cwhite)
                                + Text("구슬을 열어보세요").font(.system(size: 18))
                                .foregroundColor(
                                    .cwhite)
                        }
                        Spacer()
                    }

                }
                .onAppear {
                    todayBall = balls.filter {
                        Calendar.current.isDate(
                            $0.openDate, inSameDayAs: Date())
                    }
                    todayBallCount = todayBall.count
                    todayBallExist = !todayBall.isEmpty
                }
            }
        }
    }
}

#Preview {
    HomePage().modelContainer(for: Ball.self, inMemory: true)
}

//#Preview {
//    let config = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try! ModelContainer(for: Ball.self, configurations: config)
//
//    // 샘플 이미지 (시스템 이미지로 대체)
//    let sampleImage = UIImage(systemName: "heart.fill")!
//    let imageData = sampleImage.jpegData(compressionQuality: 0.8)!
//
//    // 오늘 날짜
//    let today = Date()
//
//    var dummyBalls = [
//        Ball(
//            createDate: "2025-04-20",
//            image: imageData,
//            content: "햇살 좋은 날 산책해서 기분이 좋았어요!",
//            openDate: today,
//            isOpen: false
//        ),
//        Ball(
//            createDate: "2025-04-20",
//            image: imageData,
//            content: "친구가 고마운 말을 해줘서 마음이 따뜻했어요.",
//            openDate: today,
//            isOpen: false
//        ),
//    ]
//
//    for ball in dummyBalls {
//        container.mainContext.insert(ball)
//    }
//
//    return HomePage()
//        .modelContainer(container)
//}
