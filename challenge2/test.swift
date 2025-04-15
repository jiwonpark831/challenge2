//
//  test.swift
//  challenge2
//
//  Created by jiwon on 4/15/25.
//

import SwiftUI
import PhotosUI


struct test: View {
    @State var selectedItems: PhotosPickerItem? = nil


    var body: some View {
        PhotosPicker(selection: $selectedItems,
                     matching: .images) {
            Text("Select Multiple Photos")
        }
    }
}

#Preview {
    test()
}
