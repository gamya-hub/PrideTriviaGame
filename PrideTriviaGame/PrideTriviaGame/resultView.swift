//
//  resultView.swift
//  PrideTriviaGame
//
//  Created by Gamya Madhuchetti on 6/11/26.
//

import Foundation
import SwiftUI

struct ResultView: View {
    let score: Int
    let totalQuestions: Int
    @Binding var gameStarted: Bool
    @Binding var gameFinished: Bool
    
    var percentage: Int {
        (score * 100) / (totalQuestions * 10)
    }
    
    var resultMessage: (emoji: String, title: String, message: String) {
        switch percentage {
        case 90...100:
            return ("🏆", "Outstanding!", "You're a Pride and Alan Turing expert! Turing himself would be proud of you!")
        case 70...89:
            return ("🌈", "Excellent!", "You have brilliant knowledge of LGBTQIA+ history. Keep celebrating Pride!")
        case 50...69:
            return ("⭐", "Well Done!", "Good effort! There's always more to learn about this incredible history.")
        case 30...49:
            return ("💡", "Keep Learning!", "Every question is a chance to learn something new. Try again!")
        default:
            return ("🌱", "Just Getting Started!", "Don't give up! This history is worth knowing. Give it another go!")
        }
    }
    
    var body: some View {
        ZStack {
            Color(hex: "1a0533")
                .ignoresSafeArea()
            
            VStack(spacing: 25) {
                
                Spacer()
                
                // Result emoji and title
                VStack(spacing: 10) {
                    Text(resultMessage.emoji)
                        .font(.system(size: 80))
                    
                    Text(resultMessage.title)
                        .font(.system(size: 36, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.red, .orange, .yellow, .green, .blue, .purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    
                    Text(resultMessage.message)
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                // Score card
                VStack(spacing: 20) {
                    
                    // Score display
                    VStack(spacing: 5) {
                        Text("Your Score")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                        
                        HStack(alignment: .bottom, spacing: 5) {
                            Text("\(score)")
                                .font(.system(size: 60, weight: .bold))
                                .foregroundColor(.yellow)
                            Text("/ \(totalQuestions * 10)")
                                .font(.system(size: 24))
                                .foregroundColor(.white.opacity(0.5))
                                .padding(.bottom, 8)
                        }
                        
                        Text("\(percentage)% Correct")
                            .font(.system(size: 16))
                            .foregroundColor(.white.opacity(0.7))
                    }
                    
                    Divider()
                        .background(Color.white.opacity(0.2))
                    
                    // Stats row
                    HStack(spacing: 30) {
                        VStack {
                            Text("\(score / 10)")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.green)
                            Text("Correct")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.6))
                        }
                        
                        VStack {
                            Text("\(totalQuestions - (score / 10))")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.red)
                            Text("Wrong")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.6))
                        }
                        
                        VStack {
                            Text("\(totalQuestions)")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.blue)
                            Text("Total")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.6))
                        }
                    }
                }
                .padding()
                .background(Color(hex: "2d1054"))
                .cornerRadius(20)
                .padding(.horizontal)
                
                // Alan Turing quote
                VStack(spacing: 8) {
                    Text("\"We can only see a short distance ahead, but we can see plenty there that needs to be done.\"")
                        .font(.system(size: 14))
                        .italic()
                        .foregroundColor(.white.opacity(0.7))
                        .multilineTextAlignment(.center)
                    
                    Text("— Alan Turing")
                        .font(.caption)
                        .foregroundColor(.purple)
                }
                .padding()
                .background(Color(hex: "2d1054"))
                .cornerRadius(15)
                .padding(.horizontal)
                
                Spacer()
                
                // Buttons
                VStack(spacing: 12) {
                    // Play again
                    Button {
                        gameFinished = false
                        gameStarted = false
                    } label: {
                        Text("Play Again 🌈")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(
                                    colors: [.red, .orange, .yellow, .green, .blue, .purple],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(15)
                    }
                    .padding(.horizontal)
                    
                    // Share score
                    Button {
                        shareScore()
                    } label: {
                        Text("Share Score 🏆")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "2d1054"))
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.purple, lineWidth: 2)
                            )
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
            }
        }
    }
    
    func shareScore() {
        let text = "I scored \(score)/\(totalQuestions * 10) on the Pride Trivia & Alan Turing Quiz! 🌈🏆 Test your knowledge too!"
        let av = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.windows.first?.rootViewController?
            .present(av, animated: true)
    }
}
