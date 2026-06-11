//
//  questionView.swift
//  PrideTriviaGame
//
//  Created by Gamya Madhuchetti on 6/11/26.
//

import Foundation
import SwiftUI

struct QuestionView: View {
    let questions: [TriviaQuestion]
    @Binding var score: Int
    @Binding var gameFinished: Bool
    
    @State private var currentIndex = 0
    @State private var selectedAnswer: Int? = nil
    @State private var showFunFact = false
    @State private var answerCorrect = false
    
    var currentQuestion: TriviaQuestion {
        questions[currentIndex]
    }
    
    var body: some View {
        ZStack {
            Color(hex: "1a0533")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                // Header — score and progress
                HStack {
                    VStack(alignment: .leading) {
                        Text("Question \(currentIndex + 1) of \(questions.count)")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.7))
                        
                        // Progress bar
                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.white.opacity(0.2))
                                    .frame(height: 8)
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(
                                        LinearGradient(
                                            colors: [.red, .orange, .yellow, .green, .blue, .purple],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .frame(
                                        width: geo.size.width * CGFloat(currentIndex + 1) / CGFloat(questions.count),
                                        height: 8
                                    )
                                    .animation(.easeInOut, value: currentIndex)
                            }
                        }
                        .frame(height: 8)
                    }
                    
                    Spacer()
                    
                    // Score
                    VStack(alignment: .trailing) {
                        Text("Score")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.7))
                        Text("\(score)")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.yellow)
                    }
                }
                .padding(.horizontal)
                
                // Question card
                VStack(spacing: 15) {
                    Text(currentQuestion.question)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .background(Color(hex: "2d1054"))
                .cornerRadius(20)
                .padding(.horizontal)
                
                // Answer buttons
                VStack(spacing: 12) {
                    ForEach(0..<currentQuestion.answers.count, id: \.self) { index in
                        Button {
                            if selectedAnswer == nil {
                                selectedAnswer = index
                                answerCorrect = index == currentQuestion.correctIndex
                                if answerCorrect {
                                    score += 10
                                }
                                withAnimation {
                                    showFunFact = true
                                }
                            }
                        } label: {
                            HStack {
                                Text(["A", "B", "C", "D"][index])
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(width: 30, height: 30)
                                    .background(buttonLabelColor(for: index))
                                    .cornerRadius(8)
                                
                                Text(currentQuestion.answers[index])
                                    .font(.system(size: 16))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.leading)
                                
                                Spacer()
                                
                                if let selected = selectedAnswer {
                                    if index == currentQuestion.correctIndex {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                    } else if index == selected && index != currentQuestion.correctIndex {
                                        Image(systemName: "x.circle.fill")
                                            .foregroundColor(.red)
                                    }
                                }
                            }
                            .padding()
                            .background(buttonBackground(for: index))
                            .cornerRadius(15)
                        }
                        .disabled(selectedAnswer != nil)
                    }
                }
                .padding(.horizontal)
                
                // Fun fact card
                if showFunFact {
                    VStack(spacing: 8) {
                        HStack {
                            Image(systemName: answerCorrect ? "star.fill" : "lightbulb.fill")
                                .foregroundColor(answerCorrect ? .yellow : .orange)
                            Text(answerCorrect ? "Correct! 🎉" : "Not quite!")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(answerCorrect ? .green : .red)
                        }
                        
                        Text(currentQuestion.funFact)
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.9))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        // Next button
                        Button {
                            moveToNext()
                        } label: {
                            Text(currentIndex + 1 < questions.count ? "Next Question →" : "See Results 🏆")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    LinearGradient(
                                        colors: [.purple, .blue],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .cornerRadius(12)
                                .padding(.horizontal)
                        }
                    }
                    .padding()
                    .background(Color(hex: "2d1054"))
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                
                Spacer()
            }
            .padding(.top)
        }
    }
    
    // Button background color based on answer state
    func buttonBackground(for index: Int) -> Color {
        guard let selected = selectedAnswer else {
            return Color(hex: "2d1054")
        }
        if index == currentQuestion.correctIndex {
            return Color.green.opacity(0.3)
        } else if index == selected {
            return Color.red.opacity(0.3)
        }
        return Color(hex: "2d1054")
    }
    
    // Button label color
    func buttonLabelColor(for index: Int) -> Color {
        guard let selected = selectedAnswer else {
            return Color.purple.opacity(0.6)
        }
        if index == currentQuestion.correctIndex {
            return Color.green.opacity(0.8)
        } else if index == selected {
            return Color.red.opacity(0.8)
        }
        return Color.purple.opacity(0.6)
    }
    
    // Move to next question or finish
    func moveToNext() {
        if currentIndex + 1 < questions.count {
            currentIndex += 1
            selectedAnswer = nil
            showFunFact = false
            answerCorrect = false
        } else {
            gameFinished = true
        }
    }
}
