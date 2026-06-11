//
//  welcomeView.swift
//  PrideTriviaGame
//
//  Created by Gamya Madhuchetti on 6/11/26.
//

import Foundation
import SwiftUI

struct WelcomeView: View {
    @Binding var gameStarted: Bool
    
    var body: some View {
        ZStack {
            // Background
            Color(hex: "1a0533")
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                // Title
                VStack(spacing: 10) {
                    Text("🌈")
                        .font(.system(size: 80))
                    
                    Text("Pride Trivia")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.red, .orange, .yellow, .green, .blue, .purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    
                    Text("& Alan Turing Edition")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white.opacity(0.8))
                }
                
                // Description card
                VStack(spacing: 15) {
                    Text("Test your knowledge of LGBTQIA+ history and the incredible legacy of Alan Turing — the father of modern computing.")
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.9))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Divider()
                        .background(Color.white.opacity(0.3))
                    
                    HStack(spacing: 30) {
                        VStack {
                            Text("10")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.yellow)
                            Text("Questions")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.7))
                        }
                        
                        VStack {
                            Text("10")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.yellow)
                            Text("Points each")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.7))
                        }
                        
                        VStack {
                            Text("🏆")
                                .font(.system(size: 28))
                            Text("Fun Facts")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.7))
                        }
                    }
                    .padding()
                }
                .background(Color(hex: "2d1054"))
                .cornerRadius(20)
                .padding(.horizontal)
                
                // Alan Turing tribute
                HStack(spacing: 10) {
                    Text("💻")
                    Text("Dedicated to Alan Turing (1912-1954)")
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.6))
                    Text("💻")
                }
                
                // Start button
                Button {
                    gameStarted = true
                } label: {
                    Text("Start Quiz 🌈")
                        .font(.system(size: 20, weight: .bold))
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
                        .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
    }
}

// Color extension to use hex colors
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
