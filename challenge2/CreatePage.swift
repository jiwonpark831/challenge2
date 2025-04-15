//
//  CreatePage.swift
//  challenge2
//
//  Created by jiwon on 4/14/25.
//

import SwiftUI

struct CreatePage: View {

    var today = Date()
    var formatter = DateFormatter()
    let dateformat: DateFormatter = {
        let format = DateFormatter()
        format.dateFormat = "yyyy년 MM월 dd일"
        return format
    }()

    @State var newText: String = ""

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("primary2"), Color("secondary2"),
                    ]), startPoint: .top, endPoint: .bottom)
                VStack {
                    Text("\(today, formatter: dateformat)")
                    Text("아주 작은 것이라도 좋아요")
                    Image("pickimage").resizable().frame(
                        width: 315, height: 191)
                    TextField(text: $newText) {
                        Text("감사 내용을 입력하세요")
                    }.frame(width: 315, height: 191, alignment: .topLeading)
                        .background(Color(.white).opacity(0.5)).cornerRadius(10)
                    NavigationLink {
                        SelectDatePage()
                    } label: {
                        Text("날짜 선택하기")
                    }

                }
            }.ignoresSafeArea(.all)
        }

    }
}

#Preview {
    CreatePage()
}
