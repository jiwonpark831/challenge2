//
//  MakeBallPage.swift
//  challenge2
//
//  Created by jiwon on 4/14/25.
//

import SwiftUI

struct MakeBallPage: View {

    @Binding var path: NavigationPath
    let content: String
    let picData: Data

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    .cpink, .cblue,
                ]), startPoint: .top, endPoint: .bottom)
            VStack {
                Text("구슬이 감사 저장소에 저장되었어요").foregroundColor(.cpurple).font(
                    .system(size: 20))
                Spacer().frame(height: 30)
                VStack {
                    Text(
                        "\(CreatePage.today, formatter: CreatePage.dateformat)"
                    ).foregroundColor(.ctext).font(
                        .system(size: 24, weight: .semibold))
                    Spacer().frame(height: 30)
                    if let uiImage = UIImage(data: picData) {
                        Image(uiImage: uiImage).resizable().scaledToFit().frame(
                            width: 250
                        ).cornerRadius(15)
                    }
                    Spacer().frame(height: 30)
                    Text("\(content)").foregroundColor(.cpurple).font(
                        .system(size: 18))
                }.frame(width: 343, height: 495).background(
                    RoundedRectangle(cornerRadius: 30).foregroundColor(
                        .cwhite
                    ).opacity(0.7))
                Spacer().frame(height: 45)
                Button("홈으로") {
                    path.removeLast(path.count)
                }.frame(width: 315, height: 53).foregroundColor(.cwhite)
                    .background(.cpurple).cornerRadius(10).font(
                        .system(size: 20))
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
//    MakeBallPage()
//}

//#Preview {
//    MakeBallPage(path: .constant(NavigationPath()))
//}

#Preview {
    MakeBallPage(
        path: .constant(NavigationPath()),
        content: "오늘의 감사: 친구와의 따뜻한 대화",
        picData: UIImage(systemName: "star.fill")!.jpegData(
            compressionQuality: 1.0)!
    )
}
