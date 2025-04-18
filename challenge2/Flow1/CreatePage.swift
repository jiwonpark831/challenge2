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
    @State var picData: Data? = nil

    @Binding var path: NavigationPath

    var body: some View {

        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    .cpink, .cblue,
                ]), startPoint: .top, endPoint: .bottom)
            VStack {
                Text(
                    "\(CreatePage.today, formatter: CreatePage.dateformat)"
                ).foregroundColor(.ctext).font(
                    .system(size: 24, weight: .bold))
                Spacer().frame(height: 40)
                Text("아주 작은 것이라도 좋아요").foregroundColor(.ctext).font(
                    .system(size: 16))
                Spacer().frame(height: 50)
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
                            picData = data
                        }
                    }
                }

                TextField(text: $newText, axis: .vertical) {
                    Text("감사 내용을 입력하세요")
                }.padding(
                    EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16)
                )
                .frame(width: 315, height: 191, alignment: .topLeading)
                .background(.cwhite.opacity(0.7)).cornerRadius(
                    10)
                Spacer().frame(height: 60)
                Button("날짜 선택하기") {
                    if let data = picData {
                        path.append(
                            Path.selectDate(content: newText, picData: data))
                    }
                }.frame(width: 315, height: 53).foregroundColor(.cwhite)
                    .background(.cpurple).cornerRadius(10).font(
                        .system(size: 20, weight: .semibold))

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
