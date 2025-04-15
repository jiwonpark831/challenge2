//
//  UpdatePage.swift
//  challenge2
//
//  Created by jiwon on 4/15/25.
//

import SwiftUI

struct UpdatePage: View {
    var body: some View {

        @State var newText: String = ""

        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("primary2"), Color("secondary2"),
                    ]), startPoint: .top, endPoint: .bottom)
                VStack {
                    Text(
                        "\(CreatePage.today, formatter: CreatePage.dateformat)")
                    Image("selectpic").resizable().frame(
                        width: 315, height: 191)
                    TextField(text: $newText) {
                        Text("감사 내용을 입력하세요")
                    }.frame(width: 315, height: 191, alignment: .topLeading)
                        .background(Color("text2").opacity(0.7)).cornerRadius(
                            10)
                    NavigationLink {

                    } label: {
                        Text("감사 저장소로 보내기")
                    }

                }
            }.ignoresSafeArea(.all)
        }

    }
}

#Preview {
    UpdatePage()
}
