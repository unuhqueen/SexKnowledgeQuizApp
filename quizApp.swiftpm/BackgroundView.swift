//
//  BackgroundView.swift
//  quizApp
//
//  Created by Seungwon Choi on 2022/04/24.
//

import Foundation
import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Image("condoms")
            .resizable()
            .aspectRatio(contentMode: ContentMode.fill)
            .ignoresSafeArea()
        
        LinearGradient(colors: [.purple.opacity(0.4), .pink.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}
