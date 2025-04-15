//
//  ArchivePage.swift
//  challenge2
//
//  Created by jiwon on 4/14/25.
//

import SwiftUI

struct ArchivePage: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color("secondary2"), Color("primary2"),
                ]), startPoint: .top, endPoint: .bottom
            ).ignoresSafeArea(.all)
            VStack{
                Text("지지님이 기록한")
                Text("감사의 순간을 꺼내보세요")
                Text("총 9개의 구슬이 있어요")
//                LazyVGrid(columns: <#T##[GridItem]#>, content: <#T##() -> View#>)
                
            }
        }
    }
}

#Preview {
    ArchivePage()
}
