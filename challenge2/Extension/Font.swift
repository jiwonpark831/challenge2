//
//  Font.swift
//  challenge2
//
//  Created by jiwon on 4/16/25.
//

import SwiftUI

extension Font {
    static func pretendard(_ size: CGFloat, weight: Weight = .regular) -> Font {
        return .custom("Pretendard-\(weight.customFont)", size: size)
    }
}

extension Font.Weight {
    var customFont: String {
        switch self {
        case .light: return "ExtraLight"
        case .semibold: return "SemiBold"
        default: return "Regular"
        }
    }
}
