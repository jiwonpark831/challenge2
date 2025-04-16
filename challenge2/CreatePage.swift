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

    @Binding var path: NavigationPath

    var body: some View {

        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    .cpink, .cblue,
                ]), startPoint: .top, endPoint: .bottom)
            VStack {
                Text(
                    "\(CreatePage.today, formatter: CreatePage.dateformat)")
                Text("아주 작은 것이라도 좋아요")
                //                    ZStack {
                //                        PhotosPicker(selection: $selectPic, matching: .images) {
                //                            Image("selectpic").resizable().frame(
                //                                width: 71, height: 44)
                //                        }
                //                        .onChange(of: selectPic) { uploadPic in
                //                            Task {
                //                                if let data = try? await uploadPic?
                //                                    .loadTransferable(type: Data.self),
                //                                    let img = UIImage(data: data)
                //                                {
                //                                    pic = Image(uiImage: img)
                //                                } else {
                //                                }
                //                            }
                //                        }
                //
                //                        if let image = pic {
                //                            image
                //                                .resizable()
                //                                .scaledToFit()
                //                                .frame(height: 169)
                //                                .cornerRadius(10)
                //                        }
                //
                //                    }.frame(width: 315, height: 191).background(
                //                        Color("text2").opacity(0.7)
                //                    ).cornerRadius(10)

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
                        .cwhite.opacity(0.7)
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
                    .background(.cwhite.opacity(0.7)).cornerRadius(
                        10)
                Button("날짜 선택하기") {
                    path.append(Path.selectDate)
                }

            }
        }.ignoresSafeArea(.all)
    }
}

//#Preview {
//    CreatePage()
//}

#Preview {
    CreatePage(path: .constant(NavigationPath()))
}
