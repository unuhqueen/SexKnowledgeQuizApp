import SwiftUI

struct ContentView: View {
    @ObservedObject var gameManagerVM: GameManagerVM

    var body: some View {
        ZStack {
            BackgroundView()
            if(gameManagerVM.model.quizCompleted) {
                QuizCompletedView(gameManagerVM: gameManagerVM)
            } else {
                VStack {
                    ReusableText(text: "Sexual Knowledge Quiz!", size: 30)
                        .padding(.horizontal)
                    ReusableText(text: gameManagerVM.model.quizModel.question, size: 25)
                        .padding(.top, 80)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(width: UIScreen.main.bounds.size.width - 20, height: 60, alignment: .center)
                        .multilineTextAlignment(.center)
                    Spacer()
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 15)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        
                        
                        Circle()
                            .trim(from: 0.0, to: min(CGFloat((Double(gameManagerVM.progress) * Double(gameManagerVM.maxProgress))/100),1.0))
                            .stroke(LinearGradient(colors: [.orange, .red],
                                                   startPoint: .topLeading,
                                                   endPoint: .bottomTrailing),
                                    style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                            .rotationEffect(Angle(degrees: 270))
                            .animation(Animation.linear(duration: Double(gameManagerVM.maxProgress)), value: gameManagerVM.progress)
                        
                        ReusableText(text: String(gameManagerVM.progress), size: 30)
                    }.frame(width: 150, height: 150)
                    Spacer()
                    if(gameManagerVM.showExplanation == true) {
                        ReusableText(text: gameManagerVM.model.quizModel.explanation!, size: 25)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(width: UIScreen.main.bounds.size.width - 20, height: 60, alignment: .center)
                            .multilineTextAlignment(.center)
                            .padding(.vertical)
                    } else {
                        ReusableText(text: " ", size: 25)
                    }
                    OptionsGridView(gameManagerVM: gameManagerVM)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(gameManagerVM: GameManagerVM())
        }
    }
}
