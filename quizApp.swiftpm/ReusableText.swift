//
//  ReusableText.swift
//  quizApp
//
//  Created by Seungwon Choi on 2022/04/22.
//

import Foundation
import SwiftUI

struct ReusableText: View {
    var text: String
    var size: CGFloat
    var body: some View {
        Text(text)
            .font(.system(size: size, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .shadow(color: .purple, radius: 2, x: 0, y: 3)
            .padding()
    }
}
