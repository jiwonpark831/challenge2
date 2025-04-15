//
//  MakeBallPage.swift
//  challenge2
//
//  Created by jiwon on 4/14/25.
//

import SwiftUI

struct MakeBallPage: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("primary2"), Color("secondary2"),
                    ]), startPoint: .top, endPoint: .bottom)
                VStack{
                   
                }
            }.ignoresSafeArea(.all)
        }
    }
}

#Preview {
    MakeBallPage()
}
