//
//  File.swift
//  quizApp
//
//  Created by Seungwon Choi on 2022/04/24.
//

import Foundation
import SwiftUI

struct StartView: View {
    @ObservedObject var gameManagerVM: GameManagerVM
    var body: some View {
        NavigationView {
            NavigationLink(destination: ContentView(gameManagerVM: gameManagerVM)) {
                Text("Game start")
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(gameManagerVM: GameManagerVM())
    }
}
