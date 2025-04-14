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
        }
    }
}

#Preview {
    ArchivePage()
}
