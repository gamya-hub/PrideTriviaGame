# PrideTriviaGame
# 🌈 Pride Trivia & Alan Turing Edition

An iOS trivia game built with SwiftUI celebrating Pride Month and the legacy of Alan Turing, the father of modern computing.

[Demo Video →](https://youtube.com/shorts/cuF7QwYrt50)

## What it is

A 10-question multiple choice trivia quiz covering LGBTQIA+ history and Alan Turing's life and contributions to computer science. Questions are shuffled into a random order each time you play, with instant feedback and a fun fact after every answer.

## Features

- 10 trivia questions on Pride history and Alan Turing's legacy
- Rainbow themed UI with a deep purple background and gradient accents
- Shuffled question order every game
- Instant feedback — green for correct, red for wrong
- Fun fact shown after every answer
- Live score tracking with a rainbow progress bar
- Results screen with a personalised message based on your score
- Play Again and Share Score buttons
- Alan Turing quote on the results screen

## How to run locally

Open the project in Xcode and run it on a simulator or device.

```
git clone https://github.com/gamya-hub/PrideTriviaGame
open PrideTriviaGame.xcodeproj
```

Requires Xcode and iOS 17+.

## How it's built

Built entirely with SwiftUI, structured across five Swift files:

```
PrideTriviaGame/
├── TriviaData.swift      — Question model and all 10 questions
├── WelcomeView.swift     — Welcome screen with rainbow UI
├── QuestionView.swift    — Question screen with answer logic
├── ResultView.swift      — Results screen with score breakdown
└── ContentView.swift     — App entry point, controls screen flow
```

A few things worth noting:

- **Questions** — modeled as a struct with a question, four answers, the correct index, and a fun fact. The full array is shuffled with `.shuffled()` so the order is different every game.
- **Screen flow** — controlled by three `@State` variables (`gameStarted`, `gameFinished`, `score`) in `ContentView`. SwiftUI automatically swaps between the welcome, question, and results screens as these change.
- **Progress bar** — a `GeometryReader` and `LinearGradient` combine to create the rainbow bar that fills as you progress through the questions.
- **Results** — the percentage score is mapped to a different emoji, title, and message using a `switch` statement.

Built as part of my ongoing iOS development series, going from Swift fundamentals to building real apps step by step.

Made for the June Solstice Game Jam. 🌈
