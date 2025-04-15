//
//  CreatePage.swift
//  challenge2
//
//  Created by jiwon on 4/14/25.
//

import PhotosUI
import SwiftUI

struct CreatePage: View {

    static var today = Date()
    static var formatter = DateFormatter()
    static let dateformat: DateFormatter = {
        let format = DateFormatter()
        format.dateFormat = "yyyy년 MM월 dd일"
        return format
    }()

    @State var newText: String = ""
    @State var selectPic: PhotosPickerItem? = nil
    @State var pic: Image? = nil

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("primary2"), Color("secondary2"),
                    ]), startPoint: .top, endPoint: .bottom)
                VStack {
                    Text(
                        "\(CreatePage.today, formatter: CreatePage.dateformat)")
                    Text("아주 작은 것이라도 좋아요")
                    ZStack {
                        PhotosPicker(selection: $selectPic, matching: .images) {
                            Image("selectpic").resizable().frame(
                                width: 71, height: 44)
                        }
                    }.frame(width: 315, height: 191).background(
                        Color("text2").opacity(0.7)
                    ).cornerRadius(10)
                    TextField(text: $newText) {
                        Text("감사 내용을 입력하세요")
                    }.frame(width: 315, height: 191, alignment: .topLeading)
                        .background(Color("text2").opacity(0.7)).cornerRadius(
                            10)
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
