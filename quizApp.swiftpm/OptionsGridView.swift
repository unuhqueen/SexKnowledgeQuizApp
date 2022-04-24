//
//  OptionsGridView.swift
//  quizApp
//
//  Created by Seungwon Choi on 2022/04/22.
//

import Foundation
import SwiftUI


struct OptionsGridView: View {
    var gameManagerVM: GameManagerVM
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(170), spacing: 0), count: 2)
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(gameManagerVM.model.quizModel.optionsList) { quizOption in
                OptionCardView(quizOption: quizOption)
                    .onTapGesture {
                        gameManagerVM.verifyAnswer(selectedOption: quizOption)
                    }
            }
        }
        
    }
}

struct OptionCardView : View {
    var quizOption: QuizOption
    var body: some View {
        VStack {
            if (quizOption.isMatched) && (quizOption.isSelected) {
                OptionStatusImageView(imageName: "checkmark")
            } else if (!(quizOption.isMatched) && (quizOption.isSelected)) {
                OptionStatusImageView(imageName: "xmark")
            } else {
                OptionView(quizOption: quizOption)
            }
        }.frame(width: 150, height: 150)
            .background(setBackgroundColor())
            .cornerRadius(40)
    }
    
    func setBackgroundColor() -> Color {
        if (quizOption.isMatched) && (quizOption.isSelected) {
            return Color.green
        } else if (!(quizOption.isMatched) && (quizOption.isSelected)) {
            return Color.red
        } else {
            return Color.white
        }
    }
}

struct OptionView: View {
    var quizOption: QuizOption
    var body: some View {
        VStack{
            Text(quizOption.optionId)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(quizOption.color.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(25)
        }
    }
}

struct OptionStatusImageView: View {
    var imageName: String
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
            .foregroundColor(Color.white)
    }
}

struct OptionStatusTextView: View {
    var body: some View {
        Text("")
    }
}
