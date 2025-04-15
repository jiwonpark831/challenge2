//
//  DetailPage.swift
//  challenge2
//
//  Created by jiwon on 4/15/25.
//

import SwiftUI

struct DetailPage: View {

    @State private var removeButton: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("primary2"), Color("secondary2"),
                    ]), startPoint: .top, endPoint: .bottom)
                VStack {
                    VStack {
                        Text(
                            "\(CreatePage.today, formatter: CreatePage.dateformat)"
                        )
                        Text("사진 자리")
                        Text("내용 자리")
                    }.frame(width: 343, height: 495).background(
                        RoundedRectangle(cornerRadius: 29).foregroundColor(
                            .white
                        ).opacity(0.7))
                    HStack {
                        Button("수정") {

                        }
                        Button("삭제") {
                            removeButton = true
                        }.alert("감사 구슬을 삭제할까요?", isPresented: $removeButton) {
                            Button("아니요", role: .cancel) {
                            }
                            Button("네") {

                            }
                        }
                    }
                }
            }.ignoresSafeArea(.all)
        }
    }
}

#Preview {
    DetailPage()
}
