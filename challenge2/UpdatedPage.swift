//
//  UpdatedPage.swift
//  challenge2
//
//  Created by jiwon on 4/16/25.
//

import SwiftUI

struct UpdatedPage: View {

    @Binding var path2: NavigationPath

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    .cpink, .cblue,
                ]), startPoint: .top, endPoint: .bottom)
            VStack {
                Text("구슬이 감사 저장소에 저장되었어요")
                VStack {
                    Text(
                        "\(CreatePage.today, formatter: CreatePage.dateformat)"
                    )
                    Text("사진 자리")
                    Text("내용 자리")
                }.frame(width: 343, height: 495).background(
                    RoundedRectangle(cornerRadius: 29).foregroundColor(
                        .cwhite
                    ).opacity(0.7))
                Button("홈으로") {
                    path2.removeLast(path2.count)
                }
                //                    NavigationLink {
                //                        HomePage()
                //                    } label: {
                //                        Text("홈으로")
                //                    }
            }
        }.ignoresSafeArea(.all)
    }
}

//#Preview {
//    UpdatedPage()
//}

#Preview {
    UpdatedPage(path2: .constant(NavigationPath()))
}
