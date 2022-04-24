//
//  QuizCompletedView.swift
//  quizApp
//
//  Created by Seungwon Choi on 2022/04/23.
//

import Foundation
import SwiftUI

struct QuizCompletedView: View {
    var gameManagerVM: GameManagerVM
    var body: some View {
        VStack {
            Image(systemName: "gamecontroller.fill")
                .foregroundColor(Color.yellow)
                .font(.system(size: 60))
                .padding()
            
            ReusableText(text: gameManagerVM.model.quizWinningStatus ?
                         "THAT'S A WRAP" :
                            "GAME OVER",
                         size: 30)
            .padding(.horizontal)
            
            ReusableText(text: gameManagerVM.model.quizWinningStatus
                         ? "Thank you for playing!!"
                         : "Better luck next time",
                         size: 30)
            .padding(.horizontal)
            
            Button {
                gameManagerVM.restartGame()
            } label: {
                HStack {
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding()
                    
                    Text("Play Again")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                }
            }.frame(width: 300, height: 60, alignment: .center)
                .background(.purple.opacity(0.7))
                .cornerRadius(30)
                .padding()
            
        }
    }
}

struct QuizCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        QuizCompletedView(gameManagerVM: GameManagerVM())
    }
}
