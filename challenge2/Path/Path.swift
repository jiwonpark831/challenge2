//
//  Path.swift
//  challenge2
//
//  Created by jiwon on 4/16/25.
//

import SwiftUI

enum Path: Hashable {
    case create
    case selectDate(content: String, picData: Data)
    case doneBall(content: String, picData: Data)
}
