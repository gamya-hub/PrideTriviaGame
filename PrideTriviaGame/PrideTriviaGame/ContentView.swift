//
//  ContentView.swift
//  PrideTriviaGame
//
//  Created by Gamya Madhuchetti on 6/11/26.
//

import SwiftUI

struct ContentView: View {
    @State private var gameStarted = false
    @State private var gameFinished = false
    @State private var score = 0
    
    var body: some View {
        ZStack {
            if !gameStarted {
                WelcomeView(gameStarted: $gameStarted)
                    .transition(.opacity)
            } else if gameFinished {
                ResultView(
                    score: score,
                    totalQuestions: triviaQuestions.count,
                    gameStarted: $gameStarted,
                    gameFinished: $gameFinished
                )
                .transition(.opacity)
            } else {
                QuestionView(
                    questions: triviaQuestions,
                    score: $score,
                    gameFinished: $gameFinished
                )
                .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: gameStarted)
        .animation(.easeInOut, value: gameFinished)
        .onChange(of: gameStarted) {
            if !gameStarted {
                score = 0
            }
        }
    }
}
