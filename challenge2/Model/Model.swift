//
//  Model.swift
//  challenge2
//
//  Created by jiwon on 4/17/25.
//

import Foundation
import SwiftData

@Model
class Ball: Hashable, Identifiable {
    var id = UUID()
    var createDate: String
    var image: Data
    var content: String
    var openDate: Date
    var isOpen: Bool

    init(
        createDate: String, image: Data, content: String, openDate: Date,
        isOpen: Bool
    ) {
        self.createDate = createDate
        self.image = image
        self.content = content
        self.openDate = openDate
        self.isOpen = isOpen
    }
}
