//
//  test.swift
//  challenge2
//
//  Created by jiwon on 4/15/25.
//

import SwiftUI
import PhotosUI

struct test: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: Image? = nil

    var body: some View {
        VStack(spacing: 20) {
            if let image = selectedImage {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
            }

            PhotosPicker(
                selection: $selectedItem,
                matching: .images
            ) {
                Text("Select One Photo")
                    .foregroundColor(.blue)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
        }
        .padding()
        .onChange(of: selectedItem) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    selectedImage = Image(uiImage: uiImage)
                } else {
                    print("❌ 이미지 로딩 실패")
                }
            }
        }
    }
}


#Preview {
    test()
}
