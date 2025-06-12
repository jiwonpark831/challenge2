//
//  Path.swift
//  challenge2
//
//  Created by jiwon on 4/16/25.
//

import SwiftUI

enum Path: Hashable {
    case home
    case create
    case selectDate(content: String, picData: Data)
    case doneBall(content: String, picData: Data)
    case list
    case detail(Ball)
    case update(Ball)
    case doneUpdate(Ball)
}
