//
//  Extension+SampleModelError.swift.swift
//  MVVM-Sample-Combine-SwiftUI
//
//  Created by Takuto Nakamura on 2021/12/12.
//

extension SampleModelError {
    var errorText: String {
        switch self {
        case .invalidId:
            return "IDが未入力です。"
        case .invalidPassword:
            return "Passwordが未入力です。"
        case .invalidIdAndPassword:
            return "IDとPasswordが未入力です。"
        }
    }
}
