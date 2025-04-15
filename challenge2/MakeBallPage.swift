//
//  MakeBallPage.swift
//  challenge2
//
//  Created by jiwon on 4/14/25.
//

import SwiftUI

struct MakeBallPage: View {

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("primary2"), Color("secondary2"),
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
                            .white
                        ).opacity(0.5))
                    NavigationLink {
                        HomePage()
                    } label: {
                        Text("홈으로")
                    }
                }
            }.ignoresSafeArea(.all)
        }
    }
}

#Preview {
    MakeBallPage()
}
