//
//  HomePage.swift
//  challenge2
//
//  Created by jiwon on 4/14/25.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("primary"), Color("secondary"),
                    ]),
                    startPoint: .top, endPoint: .bottom
                )
                .ignoresSafeArea(.all)

                VStack {
                    NavigationLink{
                        ArchivePage()
                    }label: {
                        Image(systemName: "key.fill")
                    }
                   
                    Text("지지님,")
                    Text("오늘은 어떤 것이 감사했나요")

                    NavigationLink {
                        CreatePage()
                    } label: {
                        Image("ball").resizable().frame(width: 375, height: 695)
                    }

                    Text("구슬을 눌러 감사한 일을 기록해보세요")

                }

            }
        }
    }
}

#Preview {
    HomePage()
}
