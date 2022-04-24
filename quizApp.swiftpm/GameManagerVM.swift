//
//  File.swift
//  quizApp
//
//  Created by Seungwon Choi on 2022/04/22.
//

import Foundation
import SwiftUI

class GameManagerVM : ObservableObject {
    
    static var currentIndex = 0
    
    static func createGameModel(i:Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }
    
    @Published var model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
    
    
    var timer = Timer()
    var maxProgress = GameManagerVM.quizData.count * 5
    @Published var progress = 0
    @Published var showExplanation = false
    
    init() {
        self.start()
    }
    
    func verifyAnswer(selectedOption: QuizOption) {
        for index in model.quizModel.optionsList.indices {
            model.quizModel.optionsList[index].isMatched = false
            model.quizModel.optionsList[index].isSelected = false
            
        }
        if let index = model.quizModel.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId}) {
            if selectedOption.optionId ==  model.quizModel.answer {
                model.quizModel.optionsList[index].isMatched = true
                model.quizModel.optionsList[index].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if (GameManagerVM.currentIndex < GameManagerVM.quizData.count - 1) {
                        if(self.model.quizModel.explanation != nil) {
                            self.showExplanation = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.showExplanation = false
                            GameManagerVM.currentIndex = GameManagerVM.currentIndex + 1
                            self.model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
                        }
                    } else {
                        self.model.quizCompleted = true
                        self.model.quizWinningStatus = true
                        self.reset()
                    }
                }
            } else {
                model.quizModel.optionsList[index].isMatched = false
                model.quizModel.optionsList[index].isSelected = true
            }
            
        }
    }
    
    func restartGame() {
        GameManagerVM.currentIndex = 0
        model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
        self.start()
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats:true, block: { time in
            if self.progress == self.maxProgress {
                self.model.quizCompleted = true
                self.model.quizWinningStatus = false
                self.reset()
            } else {
                self.progress += 1
            }
        })
    }
    
    func reset () {
        timer.invalidate()
        self.progress = 0
    }
    
}

extension GameManagerVM {
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "Using condom is one of the way to prevent STD.",
                      answer: "True",
                      optionsList: [QuizOption(id: 11, optionId: "True", color: Color.blue),
                                    QuizOption(id: 12, optionId: "False", color: Color.red)]),
            QuizModel(question: "Touching the genitals with dirty hands during masturbation can lead to bacterial invasion.",
                      answer: "True",
                      optionsList: [QuizOption(id: 21, optionId: "True", color: Color.blue),
                                    QuizOption(id: 22, optionId: "False", color: Color.red)]),
            QuizModel(question: "Menstruation can become irregular due to environmental changes and stress.",
                      answer: "True",
                      optionsList: [QuizOption(id: 31, optionId: "True", color: Color.blue),
                                    QuizOption(id: 32, optionId: "False", color: Color.red)]),
            QuizModel(question: "There is no difference of risk between anal sex and vaginal sex",
                      answer: "False",
                      explanation: "Anal sex has a higher risk.",
                      optionsList: [QuizOption(id: 61, optionId: "True", color: Color.blue),
                                    QuizOption(id: 62, optionId: "False", color: Color.red)]),
            QuizModel(question: "Both women and men have a same sexual response cycle.",
                      answer: "False",
                      explanation: "They have a different cycle.",
                      optionsList: [QuizOption(id: 41, optionId: "True", color: Color.blue),
                                    QuizOption(id: 42, optionId: "False", color: Color.red)]),
            QuizModel(question: "Abortion is the artificial withdrawl of a normally growing fetus and its appendages out of the mother's body.",
                      answer: "True",
                      optionsList: [QuizOption(id: 51, optionId: "True", color: Color.blue),
                                    QuizOption(id: 52, optionId: "False", color: Color.red)]),
            QuizModel(question: "A loop is a contraceptive device that inserts into a woman's womb to prevent implantation of a fertilized egg.",
                      answer: "True",
                      optionsList: [QuizOption(id: 71, optionId: "True", color: Color.blue),
                                    QuizOption(id: 72, optionId: "False", color: Color.red)]),
            QuizModel(question: "Stimulation to the labia minora causes women to get sexually aroused.",
                      answer: "False",
                      explanation: "It's clitoris.",
                      optionsList: [QuizOption(id: 81, optionId: "True", color: Color.blue),
                                    QuizOption(id: 82, optionId: "False", color: Color.red)]),
            QuizModel(question: "Infection of Rubella during pregnancy causes birth of deformed babies.",
                      answer: "True",
                      optionsList: [QuizOption(id: 91, optionId: "True", color: Color.blue),
                                    QuizOption(id: 92, optionId: "False", color: Color.red)]),
            QuizModel(question: "Sex is not possible during pregnancy.",
                      answer: "False",
                      explanation: "It's possible.",
                      optionsList: [QuizOption(id: 101, optionId: "True", color: Color.blue),
                                    QuizOption(id: 102, optionId: "False", color: Color.red)]),
            QuizModel(question: "A fertilized egg implanted in the fallopian tubes is a pregnancy.",
                      answer: "False",
                      explanation: "It should be implanted in the womb.",
                      optionsList: [QuizOption(id: 111, optionId: "True", color: Color.blue),
                                    QuizOption(id: 112, optionId: "False", color: Color.red)]),
            QuizModel(question: "The normal gestation period totals 45 weeks (315 days)",
                      answer: "False",
                      explanation: "It's 40 weeks (280 days).",
                      optionsList: [QuizOption(id: 121, optionId: "True", color: Color.blue),
                                    QuizOption(id: 122, optionId: "False", color: Color.red)]),
            QuizModel(question: "Psychiatric medication can cause erectile dysfunction.",
                      answer: "True",
                      optionsList: [QuizOption(id: 131, optionId: "True", color: Color.blue),
                                    QuizOption(id: 132, optionId: "False", color: Color.red)]),
            QuizModel(question: "The mother's syphilis infection does not affect the fetus.",
                      answer: "False",
                      explanation: "A child can be born with the anaphylactic syphilis",
                      optionsList: [QuizOption(id: 141, optionId: "True", color: Color.blue),
                                    QuizOption(id: 142, optionId: "False", color: Color.red)]),
            QuizModel(question: "You can get AIDS without having sex.",
                      answer: "True",
                      optionsList: [QuizOption(id: 151, optionId: "True", color: Color.blue),
                                    QuizOption(id: 152, optionId: "False", color: Color.red)]),
            QuizModel(question: "Men's permanent contraception includes vasectomy and women's permanent contraception includes tubal ligation.",
                      answer: "True",
                      optionsList: [QuizOption(id: 161, optionId: "True", color: Color.blue),
                                    QuizOption(id: 162, optionId: "False", color: Color.red)]),
            QuizModel(question: "The menstrual cycle is a contraception method that avoids sex from 6 to 12 days before the next period.",
                      answer: "False",
                      explanation: "It's from 12 to 19 days.",
                      optionsList: [QuizOption(id: 171, optionId: "True", color: Color.blue),
                                    QuizOption(id: 172, optionId: "False", color: Color.red)]),
            QuizModel(question: "Biological orgasms of women can only be obtained through vaginal.",
                      answer: "True",
                      optionsList: [QuizOption(id: 181, optionId: "True", color: Color.blue),
                                    QuizOption(id: 182, optionId: "False", color: Color.red)]),
            QuizModel(question: "Not taking birth control pills for two to three days does not significantly affect the effectiveness of contraception.",
                      answer: "True",
                      optionsList: [QuizOption(id: 191, optionId: "True", color: Color.blue),
                                    QuizOption(id: 192, optionId: "False", color: Color.red)]),
            QuizModel(question: "In general, sex is allowed three weeks after childbirth.",
                      answer: "False",
                      explanation: "It's generally 6 weeks.",
                      optionsList: [QuizOption(id: 201, optionId: "True", color: Color.blue),
                                    QuizOption(id: 202, optionId: "False", color: Color.red)]),
        ]
    }
}
