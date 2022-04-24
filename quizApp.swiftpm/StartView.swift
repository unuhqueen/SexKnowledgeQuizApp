//
//  File.swift
//  quizApp
//
//  Created by Seungwon Choi on 2022/04/24.
//

// This view is not used for now

import Foundation
import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    Spacer()
                    ReusableText(text: "100s", size: 100)
                    ReusableText(text: """
                                 Sex
                                 Knowledge
                                 Quiz!
                                """, size: 60)
                    .multilineTextAlignment(.center)
                    Spacer()
                    NavigationLink(destination: ContentView(gameManagerVM: GameManagerVM())) {
                        ReusableText(text: "Game Start", size: 40)
                            .background(.purple.opacity(0.7))
                            .cornerRadius(20)
                    }
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
