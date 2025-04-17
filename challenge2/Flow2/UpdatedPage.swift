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
                Text("구슬이 감사 저장소에 저장되었어요").foregroundColor(.cpurple).font(
                    .system(size: 20))
                Spacer().frame(height: 30)
                VStack {
                    Text(
                        "\(CreatePage.today, formatter: CreatePage.dateformat)"
                    ).foregroundColor(.ctext).font(
                        .system(size: 24, weight: .semibold))
                    Spacer().frame(height: 30)
                    Text("사진 자리")
                    Spacer().frame(height: 30)
                    Text("내용 자리").foregroundColor(.cpurple).font(
                        .system(size: 18))
                }.frame(width: 343, height: 495).background(
                    RoundedRectangle(cornerRadius: 30).foregroundColor(
                        .cwhite
                    ).opacity(0.7))
                Spacer().frame(height: 45)
                Button("홈으로") {
                    path2.removeLast(path2.count)
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
//    UpdatedPage()
//}

#Preview {
    UpdatedPage(path2: .constant(NavigationPath()))
}
