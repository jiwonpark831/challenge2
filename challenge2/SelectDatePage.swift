//
//  SelectDatePage.swift
//  challenge2
//
//  Created by jiwon on 4/14/25.
//

import SwiftUI

struct SelectDatePage: View {

    @State private var isComplete = false
    @State private var selectDate = Date()

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("primary2"), Color("secondary2"),
                    ]), startPoint: .top, endPoint: .bottom)

                VStack {
                    Text("감사 구슬을 언제 다시 열어볼까요?")
                    DatePicker(
                        "start date", selection: $selectDate,
                        displayedComponents: [.date]
                    ).datePickerStyle(.graphical)
                    Button("감사 저장소로 보내기") {
                        isComplete = true
                    }
                    NavigationLink(
                        destination: MakeBallPage(), isActive: $isComplete
                    ) {

                    }.hidden()
                    //                    if isComplete {
                    //                        NavigationLink {
                    //                            MakeBallPage()
                    //                        } label: {
                    //
                    //                        }
                    //                    }
                }
            }.ignoresSafeArea(.all)
        }
    }
}

#Preview {
    SelectDatePage()
}
