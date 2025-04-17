//
//  ArchivePage.swift
//  challenge2
//
//  Created by jiwon on 4/14/25.
//

import SwiftUI

struct ArchivePage: View {

    let columns = [GridItem(), GridItem()]
    var ball = ["defaultball", "defaultball", "defaultball"]
    var date = ["defaultball", "defaultball", "defaultball"]

    @Binding var path2: NavigationPath

    var body: some View {

        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    .cblue, .cpink,
                ]), startPoint: .top, endPoint: .bottom
            ).ignoresSafeArea(.all)
            ScrollView {
                VStack {
                    Text("지지님이 기록한")
                    Text("감사의 순간을 꺼내보세요")
                    let i = ball.count
                    Text("총 \(i)개의 구슬이 있어요")
                    LazyVGrid(columns: columns) {
                        ForEach(0..<ball.count, id: \.self) {
                            index in
                            VStack {
                                Image(ball[index]).resizable().frame(
                                    width: 140, height: 140)
                                Text(date[index])
                            }.onTapGesture {
                                path2.append(ArchivePath.detail)
                            }
                            //                                NavigationLink {
                            //                                    DetailPage()
                            //                                } label: {
                            //                                    VStack {
                            //                                        Image(ball[index]).resizable().frame(
                            //                                            width: 140, height: 140)
                            //                                        Text(date[index])
                            //                                    }
                            //                                }
                        }

                    }
                }
            }
        }
    }

}
//
//#Preview {
//    ArchivePage()
//}

#Preview {
    ArchivePage(path2: .constant(NavigationPath()))
}
