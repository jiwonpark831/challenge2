//
//  LoginPage.swift
//  challenge2
//
//  Created by jiwon on 4/20/25.
//

import SwiftUI

struct LoginPage: View {

    let userDefaultKey = "username"

    @State private var username: String = ""
    @State private var isLogin: Bool = false

    var body: some View {
        NavigationStack {
            if isLogin {
                HomePage()
            } else {
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [
                            .cpurple, .cyellow,
                        ]),
                        startPoint: .top, endPoint: .bottom
                    ).ignoresSafeArea(.all)
                    VStack {
                        TextField("닉네임을 입력하세요", text: $username).padding(
                            EdgeInsets(
                                top: 12, leading: 16, bottom: 12, trailing: 16)
                        ).frame(width: 315, height: 50, alignment: .topLeading)
                            .background(.cwhite.opacity(0.7)).cornerRadius(
                                10)
                        Spacer().frame(height: 20)
                        Button("시작하기") {
                            UserDefaults.standard.set(
                                username, forKey: userDefaultKey)
                            isLogin = true
                        }.frame(width: 100, height: 53).foregroundColor(.cwhite)
                            .background(.cpurple).cornerRadius(10).font(
                                .system(size: 20, weight: .semibold))
                    }
                }.onAppear {
                    if UserDefaults.standard.string(forKey: userDefaultKey)
                        != ""
                        && UserDefaults.standard.string(forKey: userDefaultKey)
                            != nil
                    {
                        isLogin = true
                    }
                }
            }
        }
    }
}

#Preview {
    LoginPage()
}
