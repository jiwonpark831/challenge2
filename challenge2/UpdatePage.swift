//
//  UpdatePage.swift
//  challenge2
//
//  Created by jiwon on 4/15/25.
//

import PhotosUI
import SwiftUI

struct UpdatePage: View {

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
                    PhotosPicker(selection: $selectPic, matching: .images) {
                        ZStack {
                            Image("selectpic").resizable().frame(
                                width: 71, height: 44)

                            if let image = pic {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 169)
                                    .cornerRadius(10)
                            }

                        }.frame(width: 315, height: 191).background(
                            Color("text2").opacity(0.7)
                        ).cornerRadius(10)
                    }
                    .onChange(of: selectPic) { uploadPic in
                        Task {
                            if let data = try? await uploadPic?
                                .loadTransferable(type: Data.self),
                                let img = UIImage(data: data)
                            {
                                pic = Image(uiImage: img)
                            } else {
                            }
                        }
                    }
                    TextField(text: $newText) {
                        Text("감사 내용을 입력하세요")
                    }.frame(width: 315, height: 191, alignment: .topLeading)
                        .background(Color("text2").opacity(0.7)).cornerRadius(
                            10)
                    NavigationLink {
                        UpdatedPage()
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
