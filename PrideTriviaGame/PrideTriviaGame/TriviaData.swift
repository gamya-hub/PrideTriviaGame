//
//  TriviaData.swift
//  PrideTriviaGame
//
//  Created by Gamya Madhuchetti on 6/11/26.
//

import Foundation

struct TriviaQuestion {
    let question: String
    let answers: [String]
    let correctIndex: Int
    let funFact: String
}

let triviaQuestions: [TriviaQuestion] = [
    TriviaQuestion(
        question: "Who is considered the father of modern computing?",
        answers: ["Albert Einstein", "Alan Turing", "Charles Babbage", "Tim Berners-Lee"],
        correctIndex: 1,
        funFact: "Alan Turing created the concept of the modern computer and is widely regarded as the father of computer science."
    ),
    TriviaQuestion(
        question: "What was Alan Turing famously prosecuted for in 1952?",
        answers: ["Espionage", "Tax evasion", "Homosexuality", "Treason"],
        correctIndex: 2,
        funFact: "Turing was prosecuted for homosexuality, which was illegal in the UK at the time. He was chemically castrated as punishment."
    ),
    TriviaQuestion(
        question: "Who designed the original Pride flag in 1978?",
        answers: ["Harvey Milk", "Marsha P. Johnson", "Gilbert Baker", "Sylvia Rivera"],
        correctIndex: 2,
        funFact: "Gilbert Baker designed the original rainbow Pride flag in 1978 at the request of Harvey Milk."
    ),
    TriviaQuestion(
        question: "What does the 'B' stand for in LGBTQIA+?",
        answers: ["Bold", "Bisexual", "Binary", "Brave"],
        correctIndex: 1,
        funFact: "The B stands for Bisexual — people who are attracted to both their own and other genders."
    ),
    TriviaQuestion(
        question: "In which city did the Stonewall Riots take place in 1969?",
        answers: ["Los Angeles", "Chicago", "San Francisco", "New York City"],
        correctIndex: 3,
        funFact: "The Stonewall Riots happened at the Stonewall Inn in New York City and are considered the catalyst for the modern LGBTQ+ rights movement."
    ),
    TriviaQuestion(
        question: "What test did Alan Turing propose to measure machine intelligence?",
        answers: ["The Logic Test", "The Turing Test", "The Binary Test", "The Intelligence Test"],
        correctIndex: 1,
        funFact: "The Turing Test proposes that a machine can be considered intelligent if it can fool a human into thinking they're talking to another human."
    ),
    TriviaQuestion(
        question: "Which country was the first to legalise same-sex marriage nationwide?",
        answers: ["Canada", "Netherlands", "Spain", "Sweden"],
        correctIndex: 1,
        funFact: "The Netherlands became the first country in the world to legalise same-sex marriage in 2001."
    ),
    TriviaQuestion(
        question: "What colours were on Alan Turing's posthumous pardon medal?",
        answers: ["Red and Blue", "Gold and Silver", "Rainbow", "Black and White"],
        correctIndex: 2,
        funFact: "The medal awarded to Alan Turing featured rainbow colours, honouring both his contribution to computing and his identity."
    ),
    TriviaQuestion(
        question: "Which organisation hosted the first Pride march in 1970?",
        answers: ["GLAAD", "The Human Rights Campaign", "Gay Liberation Front", "PFLAG"],
        correctIndex: 2,
        funFact: "The Gay Liberation Front organised the first Pride marches in New York and Los Angeles in 1970, one year after Stonewall."
    ),
    TriviaQuestion(
        question: "What did Alan Turing's team crack during World War II?",
        answers: ["The Morse Code", "The Enigma Code", "The Caesar Cipher", "The Nuclear Code"],
        correctIndex: 1,
        funFact: "Turing's work at Bletchley Park cracking the Enigma Code is estimated to have shortened World War II by two to four years."
    )
].shuffled()
